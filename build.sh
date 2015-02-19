#!/bin/bash

set -x
set -e

SCRIPT_PATH=`dirname "${BASH_SOURCE[0]}"`

# Let's start with some basic stuff.
apt-get -qq update
apt-get -qq install apt-transport-https ca-certificates curl lxc iptables

# Install Docker from Docker Inc. repositories.
curl -sSL https://get.docker.com/ubuntu/ | sh

# Install the magic wrapper.
cp $SCRIPT_PATH/scripts/wrapdocker /usr/local/bin/wrapdocker
chmod +x /usr/local/bin/wrapdocker

# Install java
sudo apt-get -qq install openjdk-7-jre openjdk-7-jdk

# Bamboo
mkdir -p /bamboo
cp $SCRIPT_PATH/bamboo/* /bamboo/

# Copy start scripts
cp $SCRIPT_PATH/scripts/start.sh /
cp $SCRIPT_PATH/scripts/start_persist_env_vars.sh /
cp $SCRIPT_PATH/scripts/start_bamboo_agent.sh /
chmod +x /*.sh
