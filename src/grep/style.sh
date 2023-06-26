#!/bin/bash

clang-format -style=google -n *.c 2> tests_grep.tmp

count=$(cat tests_grep.tmp | wc -l)
if [[ $count != 0 ]]; then
    echo $(cat tests_grep.tmp)
    exit 1
else
    exit 0
fi
