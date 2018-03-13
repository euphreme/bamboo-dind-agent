#!/bin/bash

java -Dbamboo.home=$BAMBOO_HOME -jar $BAMBOO_INSTALL_DIR/atlassian-bamboo-agent-installer-$BAMBOO_SERVER_VERSION.jar $BAMBOO_SERVER_URL/agentServer/ -t $BAMBOO_SERVER_TOKEN