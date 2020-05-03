#!/bin/bash
#4.8.1 step
ls -AlR ~ > 4.8.1.log
#4.8.2a step
user=$(whoami)
sed -e "s/$user/AnotherUser/g" "4.8.1.log" > 4.8.2a.log
#4.8.2b step
awk -v user="$user" '{gsub(user,"AnotherUser");print}' < 4.8.1.log > 4.8.2b.log
#4.8.3 step
#----using file from 4.8.2a
#----removing ALL total rows from recursive listing
awk '!/^total [0-9]+/{print}' < 4.8.2a.log > 4.8.3.log
#4.8.4 step
#---- ONLY files, match to /-/ rights Bit at the start of each row
awk '/^-/{print $7"_"$6 "\t" $9}' < 4.8.3.log > 4.8.4.log
#4.8.5 step
#----files from 4.8.4.log with numbers
awk '$2 ~/[0-9]/{print $2}' < 4.8.4.log > 4.8.5.log
#4.8.6 step
#----files from 4.8.5.log with extentions.
awk '/^.*\.[a-Z0-9]*/{print}' < 4.8.5.log > 4.8.6.log
