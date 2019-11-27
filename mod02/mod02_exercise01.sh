#!/usr/bin/env bash
#
# star_printer.sh - Print a hundred lines of stars "*"
#
# Site:       https://4fasters.com.br/
#             https://www.linkedin.com/in/mateusrissi/
# Author:     Mateus Müller
#             Mateus Rissi
# Maintainer: Mateus Rissi
#
# ------------------------------------------------------------------------ #
#  This script will test if the start variable is greater or equal to the 
#  end variable and then exit with an error if the return is True or then 
#  print a hundred lines of stars "*" if the return is False.
#
#  Examples:
#      $ ./star_printer.sh
#      Print a hundred lines of stars "*". There are no flags.
# ------------------------------------------------------------------------ #
# History:
#
#   v1.0 03/10/2018, Mateus Müller:
#       - Start
#       - Funcionalities
#   v1.1 22/11/2019, Mateus Rissi:
#       - Changed the name of variable from 'comeca' to 'start'
#       - Changed the name of variable from 'ate' to 'end'
#       - Added a header
#       - Indented the code
#       - Organized the code structure
# ------------------------------------------------------------------------ #
# Tested on:
#   bash 4.4.20
# ------------------------------------------------------------------------ #
# Thanks:
#
# 	Karen - Made dinner tonight so I could study.
# ------------------------------------------------------------------------ #

# ------------------------------- VARIABLES ----------------------------------------- #
START=0
END=100
# ------------------------------------------------------------------------ #

# ------------------------------- TESTS ----------------------------------------- #
if [[ $START -ge $END ]]; then
    exit 1
fi
# ------------------------------------------------------------------------ #

# ------------------------------- FUNCTIONS ----------------------------------------- #
# Nothing to see here
# ------------------------------------------------------------------------ #

# ------------------------------- EXECUTION ----------------------------------------- #
for i in $(seq $START $END); do
    for j in $(seq $i $END); do
        printf "*"
    done
    printf "\n"
done
# ------------------------------------------------------------------------ #
