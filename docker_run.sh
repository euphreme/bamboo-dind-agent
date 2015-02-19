#!/bin/bash

docker run --privileged -d --name bamboo-agent -h bamboo-agent.tk.int.taktik.be -e DOCKER_DAEMON_ARGS="--bip=192.168.100.1/24" docker.taktik.be/bamboo-dind-agent
