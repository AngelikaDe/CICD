#!/bin/bash

COUNTER_SUCCESS=0
COUNTER_FAIL=0
DIFF_RES=""
echo "" > log.txt


  for var2 in -v -n -h -l -c -s -o
  do
      for var3 in -v -n -h -l -c -s -o
      do
        if [ $var2 != $var3 ] 
        then
          TEST1="$var2 int s21_grep.c s21_grep.h Makefile"
          leaks -quiet -atExit -- ./s21_grep $TEST1 > test_s21_grep.log
    	  leak=$(grep -A100000 leaks test_s21_grep.log)
    	  if [[ $leak == *"0 leaks for 0 total leaked bytes"* ]]
            then
              (( COUNTER_SUCCESS++ ))
              echo "\033[32msuccess\033[0m grep $TEST1"
              
            else
              (( COUNTER_FAIL++ ))
              echo "\033[31mfail\033[0m grep $TEST1"
          fi
          rm test_s21_grep.log

          TEST2="$var2 $var3 int s21_grep.c"
          leaks -quiet -atExit -- ./s21_grep $TEST2 > test_s21_grep.log
    	  leak=$(grep -A100000 leaks test_s21_grep.log)
    	  if [[ $leak == *"0 leaks for 0 total leaked bytes"* ]]
            then
              (( COUNTER_SUCCESS++ ))
              echo "\033[32msuccess\033[0m grep $TEST2"
            else
              (( COUNTER_FAIL++ ))
              echo "\033[31mfail\033[0m grep $TEST2"
          fi
          rm test_s21_grep.log

          TEST3="-e for -e ^int s21_grep.c s21_grep.h Makefile"
          leaks -quiet -atExit -- ./s21_grep $TEST3 > test_s21_grep.log
    	  leak=$(grep -A100000 leaks test_s21_grep.log)
    	  if [[ $leak == *"0 leaks for 0 total leaked bytes"* ]]
            then
              (( COUNTER_SUCCESS++ ))
              echo "\033[32msuccess\033[0m grep $TEST3"
            else
              (( COUNTER_FAIL++ ))
              echo "\033[31mfail\033[0m grep $TEST3"
          fi
 		   rm test_s21_grep.log

          TEST4="$var3 -e int s21_grep.c"
          leaks -quiet -atExit -- ./s21_grep $TEST4 > test_s21_grep.log
    	  leak=$(grep -A100000 leaks test_s21_grep.log)
    	  if [[ $leak == *"0 leaks for 0 total leaked bytes"* ]]
            then
              (( COUNTER_SUCCESS++ ))
              echo "\033[32msuccess\033[0m grep $TEST4"
            else
              (( COUNTER_FAIL++ ))
              echo "\033[31mfail\033[0m grep $TEST4"
          fi
           rm test_s21_grep.log

          TEST5="-f pattern.txt s21_grep.c"
          leaks -quiet -atExit -- ./s21_grep $TEST5 > test_s21_grep.log
    	  leak=$(grep -A100000 leaks test_s21_grep.log)
    	  if [[ $leak == *"0 leaks for 0 total leaked bytes"* ]]
            then
              (( COUNTER_SUCCESS++ ))
              echo "\033[32msuccess\033[0m grep $TEST5"
            else
              (( COUNTER_FAIL++ ))
              echo "\033[31mfail\033[0m grep $TEST5"
          fi
           rm test_s21_grep.log

        fi
      done
  done

echo "SUCCESS: $COUNTER_SUCCESS"
echo "FAIL: $COUNTER_FAIL"
