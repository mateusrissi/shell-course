#!/usr/bin/env bash

# extract_4Fasters.sh - Extract titles from 4Fasters website

# Site:       https://www.linkedin.com/in/mateusrissi/
# Author:     Mateus Rissi
# Maintainer: Mateus Rissi

#  This script will extract the titles from 4Fasters website using regular
#  expressions and then print them on the screen.
#
#  Examples:
#      $ ./extract_4Fasters.sh
#      It will extract the titles from the website and show them on the screen.

# History:
#   v1.0.0 03/10/2019, Mateus:
#       - Start
#       - Funcionalities

# Tested on:
#   bash 4.4.20
# --------------------------------------------------------------------------- #

# VARIABLES
CYAN="\033[36;1m"
RED="\033[31;1m"
NO_COLOR="\033[0m"

TITLES_FILE="titles.txt"
CONF_FILE="configuration.cf"

PRINT_ART=0

# TESTS
[[ ! -x "$(which lynx)" ]] && echo -e "${RED}Lynx is not installed!${NO_COLOR}" && exit 1

# FUNCTIONS
extracter() {
    lynx -source https://4fasters.com.br/ | egrep 'id="featured-thumbnail"' | sed 's/.*title="//;s/".*//'  > "${TITLES_FILE}"
}

printer() {
    while read -r title_4Fasters
    do
        echo -e "\n${CYAN}${title_4Fasters}${NO_COLOR}"
    done < "${TITLES_FILE}"
    rm "${TITLES_FILE}"
}

art_printer() {
    echo -e '
    \n
             _     _____ _   _ _   ___   __    ___ ______ ___   _____ _____ ___________  _____ 
            | |   |_   _| \ | | | | \ \ / /   /   ||  ___/ _ \ /  ___|_   _|  ___| ___ \/  ___|
            | |     | | |  \| | | | |\ V /   / /| || |_ / /_\ \\ `--.  | | | |__ | |_/ /\ `--. 
            | |     | | | . ` | | | |/   \  / /_| ||  _||  _  | `--. \ | | |  __||    /  `--. \
            | |_____| |_| |\  | |_| / /^\ \ \___  || |  | | | |/\__/ / | | | |___| |\ \ /\__/ /
            \_____/\___/\_| \_/\___/\/   \/     |_/\_|  \_| |_/\____/  \_/ \____/\_| \_|\____/ 

    '
}

# EXEC
eval $(./parser.sh ${CONF_FILE})

[[ $(echo ${CONF_PRINT_4FASTERS_ART}) = 1 ]] && PRINT_ART=1

extracter
printer

[[ ${PRINT_ART} = 1 ]] && art_printer
