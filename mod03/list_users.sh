#!/usr/bin/env bash
#
# list_users.sh - Will extract the users from /etc/passwd
#
# Site:       https://www.linkedin.com/in/mateusrissi/
# Author:     Mateus Rissi
# Maintainer: Mateus Rissi
#
# ------------------------------------------------------------------------ #
#  This script will extract the users from /etc/passwd with the options to
#  turn them uppercase and to put them into alphabetical order.
#
#  Examples:
#      $ ./list_users.sh -s -m
#      -s flag will put them into alphabetical order and -m will turn them
#      uppercase.
# ------------------------------------------------------------------------ #
# History:
#
#   v1.0.0 22/11/2019, Mateus:
#       - Start
#       - Funcionalities
#
#   v1.1.0 22/11/2019, Mateus:
#       - adding shift in while loop
#       - adding flags
# ------------------------------------------------------------------------ #
# Tested on:
#   bash 4.4.20
# ------------------------------------------------------------------------ #

# ------------------------------- VARIABLES ------------------------------ #
USERS="$(cat /etc/passwd | cut -d : -f 1)"
HELP_MESSAGE="
    $(basename $0) - [OPTIONS]

    -h - Help menu
    -v - Version
    -s - Put output into alphabetical order
    -u - Convert output to uppercase
"

VERSION="v1.1.0"
SORT_KEY=0
UPPER_KEY=0
# ------------------------------------------------------------------------ #

# ------------------------------- EXEC ----------------------------------- #
while test -n "${1}"
do
    case "${1}" in
        -h) echo "${HELP_MESSAGE}" && exit 0                           ;;
        -v) echo "${VERSION}" && exit 0                                ;;
        -s) SORT_KEY=1                                                 ;;
        -u) UPPER_KEY=1                                                ;;
         *) echo "Invalid option '${1}'! Use '-h' for help." && exit 1 ;;
    esac
    shift
done
# ------------------------------------------------------------------------ #

[[ SORT_KEY -eq 1 ]] && USERS=$(echo "${USERS}" | sort)
[[ UPPER_KEY -eq 1 ]] && USERS=$(echo "${USERS^^}")

echo "${USERS}"
