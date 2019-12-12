#!/usr/bin/env bash

OUTPUT=$(cut -d : -f 1 /etc/group)
MY_NAME="mtr"

echo -e '\n\033[35;1mGroups that start with "r" on /etc/group file\e[0m'
echo "${OUTPUT}" | egrep "^r"

echo -e '\n\033[35;1mGroups that have "t" at the ending on /etc/group file\e[0m'
echo "${OUTPUT}" | egrep "t$"

echo -e '\n\033[35;1mGroups that start with "r" and also end with "t" on /etc/group file\e[0m'
echo "${OUTPUT}" | egrep "^r.*t$"

echo -e '\n\033[35;1mGroups that end with "e" or "d" on /etc/group file\e[0m'
echo "${OUTPUT}" | egrep "[ed]$"

echo -e '\n\033[35;1mGroups that do not end with "e" or "d" on /etc/group file\e[0m'
echo "${OUTPUT}" | egrep "[^ed]$"

echo -e '\n\033[35;1mGroups that the second letter is "u" or "d" on /etc/group file\e[0m'
echo "${OUTPUT}" | egrep "^.[ud]"

echo -e '\n\033[35;1mGroups that have my name in it and also are 2 to 4 digits long on /etc/group file\e[0m'
echo "${OUTPUT}" | egrep "${MY_NAME}" | egrep "{2,4}"

echo -e '\n\033[35;1mGroups that start with "r" or "s" on /etc/group file (using the OR operator)\e[0m'
echo "${OUTPUT}" | egrep "^r|^s"
