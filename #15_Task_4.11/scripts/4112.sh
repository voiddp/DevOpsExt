#!/bin/bash
##Task 4.11.2
echo
echo ===========
echo "Task 4.11.2."
echo "User's Home directory:"
echo $HOME
echo "Contains usual files:"
find $HOME -type f | rev | cut -d/ -f1 | rev | grep -ve "^\." | wc -l
echo "Hidden files:"
find $HOME -type f | rev | cut -d/ -f1 | rev | grep -e "^\." | wc -l
