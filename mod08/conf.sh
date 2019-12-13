#!/usr/bin/env bash

# conf.sh - Brief description

# Site:       https://www.linkedin.com/in/mateusrissi/
# Author:     Mateus Rissi
# Maintainer: Mateus Rissi

#  Full description
#  Examples:
#      $ ./conf.sh
#      Command description.

# History:
#   v1.0.0 13/12/2019, Mateus:
#       - Start
#       - Funcionalities

# Tested on:
#   bash 4.4.20
# --------------------------------------------------------------------------- #

# VARIABLES
CONF_FILE="config.cf"
COLOR_ON="1"
UPPERCASE_ON="1"
MESSAGE="Test message"

PURPLE="\033[35;1m"
CYAN="\033[36;1m"
NO_COLOR="\033[0m"

# TESTS
[[ ! -r ${CONF_FILE} ]] && echo "You do not have the permission to read the configuration file!" && exit 1

# FUNCTIONS


# EXEC

