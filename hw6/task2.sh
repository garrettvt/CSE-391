#!/bin/bash

####################################
# Name: Garrett Tashiro
# CSE 391 - Summer 2022
# Homework 6 - Task 2
####################################

function problem4 {
  # Type your answer to problem #4 below this line
  grep -E '^([a-zA-Z0-9]{1,16})(+[@])([a-z0-9]+[\.])([a-z]{2,})' emails.txt
}

function problem5 {
  # Type your answer to problem #5 below this line
  grep -E '.*[A-Z].*[a-z].*[0-9]|.*[0-9].*[a-z].*[A-Z]|.*[a-z].*[A-Z].*[0-9]' passwords.txt
}

function problem6 {
  # Type your answer to problem #6 below this line
  grep -E '^(5[0-9]{3}+\s)([0-9]{4}+\s)([0-9]{4}+\s)([0-9]{4})|^(4[0-9]{3}+\s)([0-9]{4}+\s)([0-9]{4}+\s)([0-9]{1,4})$' cards.txt
}
