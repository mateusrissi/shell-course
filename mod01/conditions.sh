#!/usr/bin/env bash

VAR1=""
VAR2=""

echo "${VAR1}"
if [[ "${VAR1}" = "${VAR2}" ]]; then
    echo "Equals!"
fi

if [[ "${VAR1}" = "${VAR2}" ]]
then
    echo "Equals!"
fi

if test "${VAR1}" = "${VAR2}"
then
    echo "Equals!"
fi


echo "--------------------------"
[[ "${VAR1}" = "${VAR2}" ]] && echo "Equals!" || echo "Not equals!"
