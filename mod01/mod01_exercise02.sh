#!/usr/bin/env bash

for (( i = 0; i <= 10; i++ )); do
    [[ $((${i}%2)) -eq 0 ]] && echo "${i} is divisible by 2" || echo "${i} isn't divisible by 2"
done
