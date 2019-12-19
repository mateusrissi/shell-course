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

# TESTS
[[ ! -x "$(which lynx)" ]] && echo -e "${RED}Lynx is not installed!${NO_COLOR}" && exit 1

# FUNCTIONS
extracter() {
    lynx -source https://4fasters.com.br/ | egrep 'id="featured-thumbnail"' | sed 's/.*title="//;s/".*//'  > "${TITLES_FILE}"
}

printer() {
    while read -r title_4Fasters
    do
        echo -e "${CYAN}${title_4Fasters}${NO_COLOR}\n"
    done < "${TITLES_FILE}"
    rm "${TITLES_FILE}"
}

# EXEC

extracter
printer
