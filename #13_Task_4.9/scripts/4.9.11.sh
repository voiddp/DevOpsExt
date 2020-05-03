#!/bin/bash
#Subtask 4.9.11
echo "============"
echo "Task 4.9.11:"
echo
echo "Last directory in \$PATH:"
echo "1:"$'\t'$(echo $PATH | rev | cut -d: -f1 | rev)
echo "2:"$'\t'$(echo $PATH | awk -F: '{print $(NF)}')
echo "3:"$'\t'$(echo $PATH | grep -oE '[/a-Z]+$')
