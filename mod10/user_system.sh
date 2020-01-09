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
#   v1.0.0 04/01/2019, Mateus:
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
[ ! -f "${DATABASE_FILE}" ] && echo "ERROR. File does not exist." && exit 1
[ ! -r "${DATABASE_FILE}" ] && echo "ERROR. You do not have the permission to read the file." && exit 1
[ ! -w "${DATABASE_FILE}" ] && echo "ERROR. You do not have the permission to write at the file." && exit 1
[ ! -x "$(which dialog)" ] && sudo apt install dialog 1> /dev/null 2>&1

# FUNCTIONS
listUsers() {
  egrep -v "^#|^$" "${DATABASE_FILE}" | tr : ' ' > "${TEMP}"
  dialog --title "User List" --textbox "${TEMP}" 0 0
  rm -f "${TEMP}"
}

validateUser() {
  grep -i -q "${1}${DELIMITER}" "${DATABASE_FILE}"
}

# EXEC
while :
do
  action=$(dialog --title "User Management" \
    --stdout \
    --menu "Choose an option:" \
    0 0 0 \
    list "List all users" \
    insert "Insert an user" \
    remove "Remove an user")
  
  [ $? -ne 0 ] && exit

  case "${action}" in
    list) listUsers ;;
    insert)
      next_id="$(($(egrep -v "^#|^$" "${DATABASE_FILE}" | sort -h | tail -n 1 | cut -d : -f 1)+1))"
      name=$(dialog --title "New User Register" --stdout --inputbox "Name" 0 0)
      [ $? -ne 0 ] && continue
      
      validateUser "${name}" && {
        dialog --title "Error" --msgbox "User already is in the system!" 0 0
        exit 1
      }

      email=$(dialog --title "New User Register" --stdout --inputbox "Email" 0 0)
      [ $? -ne 0 ] && continue
      
      echo "${next_id}${DELIMITER}${name}${DELIMITER}${email}" >> "${DATABASE_FILE}"

      dialog --msgbox "User registered with success!" 0 0
    ;;
    remove)
      users=$(egrep "^#|^$" -v "${DATABASE_FILE}" | sort -h | cut -d ${DELIMITER} -f 1,2 | sed 's/:/ "/;s/$/"/')
      user_id=$(eval dialog --stdout --menu \"Choose an user to remove\" 0 0 0 ${users})
      [ $? -ne 0 ] && continue

      grep -i -v "${user_id}${DELIMITER}" "${DATABASE_FILE}" > "$TEMP"
      mv "${TEMP}" "${DATABASE_FILE}"

      dialog --msgbox "User removed with success!" 0 0
    ;;
  esac
done