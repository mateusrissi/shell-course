#!/usr/bin/env bash

echo 'test'


NAME="Mateus 

Rissi"

echo "${NAME}"

N1=45
N2=24

TOTAL=$((N1+N2))

echo "${TOTAL}"

CAT_OUTPUT=$(cat /etc/passwd | grep mtr)

echo "${CAT_OUTPUT}"

echo "--------------------------"

echo "Parameter 1: ${1}"
echo "Parameter 2: ${2}"

echo "All parameters: ${*}"

echo "Parameter 0: ${0}"

echo "Parameters quantity: ${#}"

echo "PID: ${$}"
