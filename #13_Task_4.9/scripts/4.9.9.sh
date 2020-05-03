#!/bin/bash
#Subtask 4.9.9
echo "============"
echo "Task 4.9.9:"
echo
echo "before:"$'\t' "$(date)"
echo "after:"$'\t' "$(date | awk '{print $1" "$3" "$2" "$4" "$5}')"
echo "efter2:"$'\t' $(date '+%A, %B %d %Y %T')
