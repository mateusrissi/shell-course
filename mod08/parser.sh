#!/usr/bin/env bash

CONF_FILE="${1}"
RED="\033[31;1m"

[[ ! -e ${CONF_FILE} ]] && echo -e "${RED}File does not exist!" && exit 1
[[ ! -r ${CONF_FILE} ]] && echo -e "${RED}You do not have the permission to read the configuration file!" && exit 1


while read -r line; do
    [[ $(echo ${line} | cut -c1) = "#" ]] || [[ ! ${line} ]] && continue
    
    key="$(echo ${line} | cut -d = -f 1)"
    value="$(echo ${line} | cut -d = -f 2)"

    echo "CONF_${key}=${value}"
done < "${CONF_FILE}"
