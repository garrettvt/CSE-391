#!/bin/bash

####################################
# Name: Garrett Tashiro
# CSE 391 - Summer 2022
# Homework 7 - Task 1
####################################

function problem1 {
  # Type your answer to problem #1 below this line
  # -i for in-place. \< for starts with Insert, (.*) for words in the middle
  # and \> after Here to say that is the end of the word.
  sed -i 's/\<Insert (.*) Here\>/Sed What I Sed/g' GenerateSite.java
}

function problem2 {
  # Type your answer to problem #2 below this line
  # -i for in-place. Have "gi" at the end for global and case-insenseitive.
  sed -i 's/dirt/soil/gi' Products.java
}

function problem3 {
  # Type your answer to problem #3 below this line
  # Double sed, one for each file (don't know if there is a catch all for just two)
  # changed all publics to privates. Might need to tweak.
  sed -i 's/public/private/g' Product.java | sed -i 's/public/private/g' Employee.java
}

function problem4 {
  # Type your answer to problem #4 below this line
  # Need double sed. First deletes spaces, second one does grouping and in-place.
  sed 's/ //g' cards.txt | sed -Ei 's/([0-9]{4})/\1 /g' cards.txt
}

function problem5 {
  # Type your answer to problem #5 below this line
  sed -r 's/(\/\*) ([^\n].*) (\*\/)$/\/\/ \2/g' Products.java
}

function problem6 {
  # Type your answer to problem #6 below this line
  # *.java for replacing in all java files
  sed -i 's/FAANG/24AndMe/gi' *.java
}

function problem7 {
  # Type your answer to problem #7 below this line
  echo "not yet implemented"
}

function problem8 {
  # Type your answer to problem #8 below this line
  echo "not yet implemented"
}

function problem9 {
  # Type your answer to problem #9 below this line
  echo "not yet implemented"
}

