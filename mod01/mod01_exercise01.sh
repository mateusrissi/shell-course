#!/usr/bin/env bash

if [[ "${1}" -gt "10" ]]; then
    echo "
        Script name: ${0}
        PID: ${$}
    "
else
    echo "First parameter isn't greater than 10!"
fi
