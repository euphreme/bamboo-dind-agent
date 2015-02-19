#!/bin/bash
#
# This script simply persist some environment variables in /root/.bashrc
#

# Special ETCD variable
export DOCKER_DAEMON_ARGS=${DOCKER_DAEMON_ARGS:-false}
echo "export DOCKER_DAEMON_ARGS=$DOCKER_DAEMON_ARGS" >> /root/.bashrc

# Reload .profile
source /root/.bashrc
