#!/usr/bin/env bash

CONF_FILE="config.cf"
MESSAGE="Test message"
UPPERCASE_ON=0
COLORS_ON=0

RED="\033[031;1m"

eval $(./parser.sh ${CONF_FILE})

[[ $(echo ${CONF_USE_UPPERCASE}) = 1 ]] && UPPERCASE_ON=1
[[ $(echo ${CONF_USE_COLORS}) = 1 ]] && COLORS_ON=1

[[ ${UPPERCASE_ON} = 1 ]] && MESSAGE="$(echo -e "${MESSAGE}" | tr [a-z] [A-Z])"
[[ ${COLORS_ON} = 1 ]] && MESSAGE="$(echo -e "${RED}${MESSAGE}")"

echo ${MESSAGE}
