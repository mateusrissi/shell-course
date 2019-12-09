#!/usr/bin/env bash
#
# script_name.sh - Brief description
#
# Site:       https://www.linkedin.com/in/mateusrissi/
# Author:     Mateus Rissi
# Maintainer: Mateus Rissi
#
# --------------------------------------------------------------------------- #
#  Description
#
#  Examples:
#      $ ./script_name.sh -d 1
#      Command description.
#
# --------------------------------------------------------------------------- #
# History:
#
#   v1.0 03/10/2019, Mateus:
#       - Start
#       - Funcionalities
#   v1.1 10/10/2019, Mateus:
#       - Modified functions bip bop
#
# --------------------------------------------------------------------------- #
# Tested on:
#   bash 4.4.20
#
# --------------------------------------------------------------------------- #
# Thanks:
#
# 	Bip - Found a bug at the login snippet.
#	Bop - Suggested the addition of -h at the script calling.
#
# --------------------------------------------------------------------------- #

# -------------------------------- VARIABLES -------------------------------- #
DEBUGGING_KEY=0
DEBUGGING_LEVEL=0

# ---------------------------------- TESTS ---------------------------------- #


# -------------------------------- FUNCTIONS -------------------------------- #
Debugging() {
    [ "${1}" -le "${DEBUGGING_LEVEL}" ] && echo "Debugging ${*} -----"
}

Sum() {
    local total=0
    for i in $(seq 1 25); do
        Debugging 1 "Entered with value: ${i}"
        total=$((${total}+${i}))
        Debugging 2 "After Sum: ${total}"
    done
    echo ${total}
}

# ----------------------------------- EXEC ---------------------------------- #
case "${1}" in
    -d) [ "${2}" ] && DEBUGGING_LEVEL="${2}" ;;
     *) Sum                                      ;;
esac

Sum
