#!/usr/bin/env bash

# conf.sh - Read the conf file and output a message according the options

# Site:       https://www.linkedin.com/in/mateusrissi/
# Author:     Mateus Rissi
# Maintainer: Mateus Rissi

#  This script will read the configuration file and then output a message 
#  according the options (coloring and uppercase).
#
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
COLOR_ON=""
UPPERCASE_ON=""
MESSAGE="Test message"

PURPLE="\033[35;1m"
CYAN="\033[36;1m"
NO_COLOR="\033[0m"

# TESTS
[[ ! -r ${CONF_FILE} ]] && echo "You do not have the permission to read the configuration file!" && exit 1

# FUNCTIONS
setParameters() {
    local param="$(echo ${1} | cut -d = -f 1)"
    local value="$(echo ${1} | cut -d = -f 2)"

    case "${param}" in
        USE_COLORS) COLOR_ON="${value}"        ;;
        USE_UPPERCASE) UPPERCASE_ON="${value}" ;;
    esac
}

# EXEC
while read -r line; do
    [[ $(echo ${line} | cut -c1) = "#" ]] || [[ ! ${line} ]] && continue
    setParameters ${line}
done < "${CONF_FILE}"


[[ ${COLOR_ON} = 1 ]] && MESSAGE="$(echo -e "${MESSAGE}" | tr [a-z] [A-Z])"
[[ ${UPPERCASE_ON} = 1 ]] && MESSAGE="$(echo -e "${PURPLE}${MESSAGE}")"

echo ${MESSAGE}
