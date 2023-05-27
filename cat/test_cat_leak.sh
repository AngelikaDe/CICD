#!/bin/bash

SUCCESS=0
FAIL=0
DIFF_RES=""
DIFF_TEST="Files s21_cat.txt and cat.txt are identical"


for var in -b -e -n -s -t -v
do
	for var2 in tests/test_1_cat.txt tests/test_2_cat.txt tests/test_3_cat.txt tests/test_4_cat.txt tests/test_5_cat.txt
	do
	
		TEST1="$var $var2"
		leaks -quiet -atExit -- ./s21_cat $TEST1 > test_s21_cat.log
    leak=$(grep -A100000 leaks test_s21_cat.log)
    if [[ $leak == *"0 leaks for 0 total leaked bytes"* ]]
            then
			  (( COUNTER_SUCCESS++ ))
              echo "\033[32msuccess\033[0m cat $TEST1"
            else
				(( COUNTER_FAIL++ ))
              echo "$TEST1" >> log.txt
              echo "\033[31msuccess\033[0m cat $TEST1"
          fi
          rm test_s21_cat.log
	done
done

echo "SUCCESS: $COUNTER_SUCCESS"
echo "FAIL: $COUNTER_FAIL"