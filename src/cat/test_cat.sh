#!/bin/bash

SUCCESS=0
FAIL=0
DIFF_RES=""
DIFF_TEST="Files s21_cat.txt and cat.txt are identical"


for var in -b -e -n -s -t
do
	for var2 in tests/test_1_cat.txt tests/test_2_cat.txt tests/test_3_cat.txt tests/test_4_cat.txt tests/test_5_cat.txt
	do
	
		TEST1="$var $var2"
		echo "$TEST1"
		cat $TEST1 > s21_cat.txt
		cat $TEST1 > cat.txt
		DIFF_RES="$(diff -s s21_cat.txt cat.txt)"
		if [ "$DIFF_RES" = "$DIFF_TEST" ]
            then
			  (( COUNTER_SUCCESS++ ))
              echo "\033[32msuccess\033[0m cat $t"
            else
				(( COUNTER_FAIL++ ))
              echo "$TEST1" >> log.txt
              echo "\033[31msuccess\033[0m cat $t"
          fi
          rm s21_cat.txt cat.txt
	done
done

echo "SUCCESS: $COUNTER_SUCCESS"
echo "FAIL: $COUNTER_FAIL"
