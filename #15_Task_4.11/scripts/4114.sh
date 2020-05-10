#!/bin/bash
##Task 4.11.4
echo
echo ===========
echo "Task 4.11.4"
echo "Processes of user:"
echo $USER
top -bn 1 -u $USER | tail -n +8 | wc -l
echo "Processes of user: roor"
top -bn 1 -u root | tail -n +8 | wc -l
