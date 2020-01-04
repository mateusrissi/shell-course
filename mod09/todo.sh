#!/usr/bin/env bash

# todo.sh - Simple task management

# Site:       https://www.linkedin.com/in/mateusrissi/
# Author:     Mateus Rissi
# Maintainer: Mateus Rissi

#  This script purpose is doing tasks management for my daily life, like walking
#  my dog and doing grocery. It is possible to add/remove a task and show the tasks for the day.
#
#  Examples:
#      $ source todo.sh
#      This will load the functions to the shell environment.
#
#      After loading the functions you can:
#
#      $ todayTasks
#      This will show today tasks.
#
#      $ listTasks
#      This command will echo the entire list of tasks

# History:
#   v1.0.0 04/01/2020, Mateus:
#       - Start
#       - Funcionalities

# Tested on:
#   bash 4.4.20
# --------------------------------------------------------------------------- #

# VARIABLES
DATABASE_FILE='tasks.txt'
DELIMITER='|'
TEMP=temp.$$
TODAY_TASKS_FILE="/home/$(whoami)/Desktop/"

GREEN="\033[32;1m"
CYAN="\033[36;1m"

# TESTS
[ ! -f "$DATABASE_FILE" ] && echo "ERROR. File does not exist." && exit 1
[ ! -r "$DATABASE_FILE" ] && echo "ERROR. You do not have the permission to read the file." && exit 1
[ ! -w "$DATABASE_FILE" ] && echo "ERROR. You do not have the permission to write at the file." && exit 1

# FUNCTIONS
showTask() {
  local title="$(echo ${1} | cut -d ${DELIMITER} -f 1)"
  local what="$(echo ${1} | cut -d ${DELIMITER} -f 2)"
  local day="$(echo ${1} | cut -d ${DELIMITER} -f 3)"
  local hour="$(echo ${1} | cut -d ${DELIMITER} -f 4)"
  local where="$(echo ${1} | cut -d ${DELIMITER} -f 5)"

  echo -e "${GREEN}Title: ${CYAN}${title}"
  echo -e "${GREEN}What: ${CYAN}${what}"
  echo -e "${GREEN}Day: ${CYAN}${day}"
  echo -e "${GREEN}Hour: ${CYAN}${hour}"
  echo -e "${GREEN}Where: ${CYAN}${where}\n"
}

listTasks() {
  while read -r line
  do
    [ "$(echo ${line} | cut -c1)" = "#" ] && continue
    [ ! "${line}" ] && continue

    showTask "${line}"
  done < "${DATABASE_FILE}"
}

insertTask() {
    echo "$*" >> "${DATABASE_FILE}"
    echo "Inserted task successfully!"
}

validateTask() {
  grep -i -q "${1}${DELIMITER}" "${DATABASE_FILE}"
}

deleteTask() {
  validateTask "$1" || return

  grep -i -v "${1}${DELIMITER}" "${DATABASE_FILE}" > "$TEMP"
  mv "${TEMP}" "${DATABASE_FILE}"

  echo "Deleted user successfully!"
}

todayTasks() {
  today_date="$(date +'%d-%m-%Y')"
  egrep "${today_date}|EVERYDAY" "${DATABASE_FILE}" > "${TODAY_TASKS_FILE}today_tasks.txt"
}
