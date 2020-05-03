#!/bin/bash
#Subtask 4.9.4
echo "================"
echo "Task 4.9.4:"
echo
num=$(find ~ -mindepth 1 -type d | grep -ve "/\." | rev | cut -d'/' -f1 | rev | wc -l)
echo "In my home directory - ${num} subdirectories, excluding hidden:"
find ~ -mindepth 1 -type d | grep -ve "/\." | rev | cut -d'/' -f1 | rev
