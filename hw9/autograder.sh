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

for kid in $(ls students/); do
		(
		echo "The $count file is $kid"
		 
	        cd ./students/$kid/

		if [ -f "task1.sh" ]; then
				echo "$kid has done it"
		else
				echo "$kid fails"
		fi

		echo
		)
done
