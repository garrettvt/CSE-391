#!/bin/bash

# This script is for hw9 in CSE 391. This script 
# is an autograder for fake student files.
# Garrett Tashiro
# SID: 2075045

# Check to see if the number of arguments that is passed
# is less than 1. 
if [ "$#" -lt 1 ]; then
	echo "Usage: ./autograder.sh MAXPOINTS"
fi

echo "Autograding CSE 391 Homework"
echo "Grading with a max score of $1"
echo

expected=$(<expected.txt)

for kid in $(ls students/); do

	echo "Processing $kid ..."

	(
       	cd ./students/$kid/

	if [ -f "task1.sh" ]; then
		./task1.sh > output.txt
		missed=$(diff -w output.txt <(echo "$expected") | grep "^>" | wc -l)
		if [ "$missed" -gt 0 ]; then
			echo "$kid has incorrect output ($missed lines do not match)"
			let score="$1 - ($missed * 5)"
			if [ "$score" -le 0 ]; then
				echo "$kid has earned a score of 0 / $1"
			else
				echo "$kid has earned a score of $score / $1"
			fi
		else
			echo "$kid has correct output"
			echo "$kid has earned a score of $1 / $1"
		fi
	else
		echo "$kid did not turn in the assignment"
		echo "$kid has earned a score of 0 / $1"
	fi

	echo
	)
done
