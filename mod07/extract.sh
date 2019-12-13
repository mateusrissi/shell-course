#!/usr/bin/env bash
#
# extract.sh - Extract titles from LXER website
#
# Site:       https://www.linkedin.com/in/mateusrissi/
# Author:     Mateus Rissi
# Maintainer: Mateus Rissi
#
# --------------------------------------------------------------------------- #
#  This script will extract the titles from LXER website using regular
#  expressions and then print them on the screen.
#
#  Examples:
#      $ ./extract.sh
#      It will extract the titles and show them.
#
# --------------------------------------------------------------------------- #
# History:
#
#   v1.0.0 13/12/2019, Mateus:
#       - Start
#       - Funcionalities
#
# --------------------------------------------------------------------------- #
# Tested on:
#   bash 4.4.20
#
# --------------------------------------------------------------------------- #

# -------------------------------- VARIABLES -------------------------------- #
GREEN="\033[32;1m"
RED="\033[31;1m"
NO_COLOR="\033[0m"

TITLES_FILE="titles.txt"

# ---------------------------------- TESTS ---------------------------------- #
[[ ! -x "$(which lynx)" ]] &&
    echo -e "${RED}Lynx is not installed!${NO_COLOR}" && exit 1

# -------------------------------- FUNCTIONS -------------------------------- #
extracter() {
    lynx -source http://lxer.com/ | grep "blurb" |
        sed 's/<div.*line">//;s/<\/span.*//' > "${TITLES_FILE}"
}

printer() {
    while read -r title_lxer
    do
        echo -e "${RED}Title: ${GREEN}${title_lxer}${NO_COLOR}"
    done < "${TITLES_FILE}"
    rm "${TITLES_FILE}"
}
# ----------------------------------- EXEC ---------------------------------- #

extracter
printer
