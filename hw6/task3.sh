#!/bin/bash

####################################
# Name: Garrett Tashiro
# CSE 391 - Summer 2022
# Homework 6 - Task 3
####################################

function problem7 {
  # Type your answer to problem #7 below this line
  grep -Ei '^[acgt]{1,}[^ ]$' dna.txt
}

function problem8 {
  # Type your answer to problem #8 below this line
  grep -Ei '^([a-z|\-]){1,}[ ].*$' dna.txt 
}

function problem9 {
  # Type your answer to problem #9 below this line
  grep -Ei -B1 '[c][a][t]' dna.txt
}

function problem10 {
  # Type your answer to problem #10 below this line
  echo "not yet implemented"
}

function problem11 {
  # Type your answer to problem #11 below this line
  echo "not yet implemented"
}

function problem12 {
  # Type your answer to problem #12 below this line
  grep -Ei '^(ATG).*?(TAA|TAG|TGA)$' dna.txt
}
