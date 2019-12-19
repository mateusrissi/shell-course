#!/usr/bin/env bash

# user_system.sh - Users management

# Site:       https://www.linkedin.com/in/mateusrissi/
# Author:     Mateus Rissi
# Maintainer: Mateus Rissi

#  This script can do user management tasks like insert a user,
#  delete a user or update a user data
#
#  Examples:
#      $ ./user_system.sh
#      This will list users.

# History:
#   v1.0.0 19/12/2019, Mateus:
#       - Start
#       - Funcionalities

# Tested on:
#   bash 4.4.20
# --------------------------------------------------------------------------- #

# VARIABLES
DATABASE_FILE="user.txt"
DELIMITER=":"
TEMP=temp.$$

GREEN="\033[32;1m"
CYAN="\033[36;1m"

# TESTS
[ ! -f "$DATABASE_FILE" ] && echo "ERROR. File does not exist." && exit 1
[ ! -r "$DATABASE_FILE" ] && echo "ERROR. You do not have the permission to read the file." && exit 1
[ ! -w "$DATABASE_FILE" ] && echo "ERROR. You do not have the permission to write at the file." && exit 1

# FUNCTIONS
showUser() {
  local id="$(echo ${1} | cut -d ${DELIMITER} -f 1)"
  local name="$(echo ${1} | cut -d ${DELIMITER} -f 2)"
  local email="$(echo ${1} | cut -d ${DELIMITER} -f 3)"

  echo -e "${GREEN}ID: ${CYAN}${id}"
  echo -e "${GREEN}Name: ${CYAN}${name}"
  echo -e "${GREEN}E-mail: ${CYAN}${email}"
}

listUsers() {
  while read -r line
  do
    [ "$(echo ${line} | cut -c1)" = "#" ] && continue
    [ ! "${line}" ] && continue

    showUser "${line}"
  done < "${DATABASE_FILE}"
}

validateUser() {
  grep -i -q "${1}${DELIMITER}" "${DATABASE_FILE}"
}

insertUser() {
  local name="$(echo ${1} | cut -d ${DELIMITER} -f 2)"

  if validateUser "${name}"
  then
    echo "ERROR. User already exists!"
  else
    echo "$*" >> "${DATABASE_FILE}"
    echo "Inserted user successfully!"
  fi
  sortList
}

deleteUser() {
  validateUser "$1" || return

  grep -i -v "${1}${DELIMITER}" "${DATABASE_FILE}" > "$TEMP"
  mv "${TEMP}" "${DATABASE_FILE}"

  echo "Deleted user successfully!"
  sortList
}

sortList() {
  sort "${DATABASE_FILE}" > "${TEMP}"
  mv "${TEMP}" "${DATABASE_FILE}"
}

# EXEC
