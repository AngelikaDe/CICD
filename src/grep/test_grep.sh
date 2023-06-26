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
          echo "$TEST1"
          ./s21_grep $TEST1 > s21_grep.txt
          grep $TEST1 > grep.txt
          DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
          if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
              echo "\033[32msuccess\033[0m grep $t"
              
            else
              echo "$TEST1" >> log.txt
              (( COUNTER_FAIL++ ))
              echo "\033[31mfail\033[0m grep $t"
          fi
          rm s21_grep.txt grep.txt

          TEST2="$var2 $var3 int s21_grep.c"
          echo "$TEST2"
          ./s21_grep $TEST2 > s21_grep.txt
          grep $TEST2 > grep.txt
          DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
          if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
              echo "\033[32msuccess\033[0m grep $t"
            else
              echo "$TEST2" >> log.txt
              (( COUNTER_FAIL++ ))
              echo "\033[31mfail\033[0m grep $t"
          fi
          rm s21_grep.txt grep.txt

          TEST3="-e for -e ^int s21_grep.c s21_grep.h Makefile"
          echo "$TEST3"
          ./s21_grep $TEST3 > s21_grep.txt
          grep $TEST3 > grep.txt
          DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
          if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
              echo "\033[32msuccess\033[0m grep $t"
            else
              echo "$TEST3" >> log.txt
              (( COUNTER_FAIL++ ))
              echo "\033[31mfail\033[0m grep $t"
          fi
          rm s21_grep.txt grep.txt

          TEST4="$var3 -e int s21_grep.c"
          echo "$TEST4"
          ./s21_grep $TEST4 > s21_grep.txt
          grep $TEST4 > grep.txt
          DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
          if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
              echo "\033[32msuccess\033[0m grep $t"
            else
              echo "$TEST4" >> log.txt
              (( COUNTER_FAIL++ ))
              echo "\033[31mfail\033[0m grep $t"
          fi
          rm s21_grep.txt grep.txt

          TEST5="-f pattern.txt s21_grep.c"
          echo "$TEST5"
          ./s21_grep $TEST5 > s21_grep.txt
          grep $TEST5 > grep.txt
          DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
          if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
              echo "\033[32msuccess\033[0m grep $t"
            else
              echo "$TEST5" >> log.txt
              (( COUNTER_FAIL++ ))
              echo "\033[31mfail\033[0m grep $t"
          fi
          rm s21_grep.txt grep.txt

        fi
      done
  done

echo "SUCCESS: $COUNTER_SUCCESS"
echo "FAIL: $COUNTER_FAIL"