#!/bin/bash
#sutask 4.9.6
echo "Task 4.9.6"
echo
echo "($1+$2)"
echo "------- =" $(echo "scale=4; ($1 + $2)/$3" | bc -l )
echo "  $3  "
