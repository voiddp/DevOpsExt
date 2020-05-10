#!/bin/bash
##Task 4.11.5
echo
echo ===========
echo "Task 4.11.5"
echo "5 Processes with biggest memory use:"
top -bn 1 -o %MEM | tail -n +7 | head -n 6
