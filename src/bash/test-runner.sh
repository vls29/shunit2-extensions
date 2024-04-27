#!/bin/bash

echo "finding tests (criteria: file ends .test.sh OR .tests.sh)"

for testFile in $(find . -type f -name "*\.test\.sh" -o -name "*.\tests\.sh"); do
    echo "Running test file '${testFile}'"
    ${testFile} || exit 1
done
