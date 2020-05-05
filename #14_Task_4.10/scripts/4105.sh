#!/bin/bash
#SubTask 4.10.5
echo ============
echo "Task 4.10.5"
for i in ${@}
do
echo "Squre value of ${i} = $(( i * i ))"
done
