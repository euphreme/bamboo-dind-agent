#!/bin/bash

set -x
set -e

SCRIPT_PATH=`dirname "${BASH_SOURCE[0]}"`

# Let's start with some basic stuff.
apt-get -qq update
apt-get -qq install apt-transport-https ca-certificates curl software-properties-common wget lxc iptables

# Prepare Docker from Docker Inc. repositories.
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Install the magic wrapper.
cp $SCRIPT_PATH/scripts/wrapdocker /usr/local/bin/wrapdocker
chmod +x /usr/local/bin/wrapdocker

# Install docker & java
apt-get -qq update
apt-get -qq install docker-ce openjdk-8-jdk ca-certificates-java

# Bamboo
mkdir -p $BAMBOO_HOME
mkdir -p $BAMBOO_INSTALL_DIR
mkdir -p $BAMBOO_CAPABILITIES_HOME

wget $BAMBOO_SERVER_URL/agentServer/agentInstaller/atlassian-bamboo-agent-installer-$BAMBOO_SERVER_VERSION.jar --no-check-certificate -P $BAMBOO_INSTALL_DIR/

# Copy start scripts
cp $SCRIPT_PATH/scripts/start.sh /
cp $SCRIPT_PATH/scripts/start_persist_env_vars.sh /
cp $SCRIPT_PATH/scripts/start_bamboo_agent.sh /
chmod +x /*.sh

# Install certificates if any
count=1
for entry in "$SCRIPT_PATH/certs"/*
do
    if [ -f "$entry" ];then
        keytool -import -alias "cert-$count" \
            -file "$entry" \
            -keystore /etc/ssl/certs/java/cacerts \
            -keypass changeit -storepass changeit -noprompt && \
            rm -rf "$entry"

        ((count++))
    fi
done