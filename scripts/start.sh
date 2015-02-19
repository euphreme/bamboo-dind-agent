#!/bin/bash

set -x
set -e

source /start_persist_env_vars.sh

wrapdocker &
/start_bamboo_agent.sh
