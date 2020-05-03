#!/bin/bash
#Subtask 4.9.8
echo "============"
echo "Task 4.9.8:"
echo
crop=${PATH#*a}
echo "\$PATH: $PATH"
echo "First posistion of \"a\" symbol"
echo "$(( ${#PATH} - ${#crop} ))"


