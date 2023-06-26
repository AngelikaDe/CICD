#!/bin/bash

clang-format -style=google -n *.c 2> tests_cat.tmp

count=$(cat tests_cat.tmp | wc -l)
if [[ $count != 0 ]]; then
    echo $(cat tests_cat.tmp)
    exit 1
else
    exit 0
fi
