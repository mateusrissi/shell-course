#!/usr/bin/env bash

echo "=== For 01"

for (( i = 0; i < 10; i++ )); do
    echo "${i}"
done

echo "=== For 02 (using seq)"

for i in $(seq -2 5); do
    echo "${i}"
done

echo "=== For 03"

FRUITS=(
    'Orange'
    'Banana'
    'Watermelon'
    'Avocado'
)

for i in "${FRUITS[@]}"; do
    echo "${i}"
done

echo "=== While"

COUNTER=0

while [[ ${COUNTER} -lt ${#FRUITS[@]} ]]; do
    echo "${FRUITS[${COUNTER}]}"
    COUNTER=$((${COUNTER} + 1))
done
