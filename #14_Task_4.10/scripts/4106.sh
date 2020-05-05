#!/bin/bash
#SubTask 4.10.6
my_math () {
	echo $(echo "scale=2; ($3-$2)/$1" | bc)
	return
}
echo ============
echo "Task 4.10.6"
echo "calculation of Linear equation"
if [ $# -ne 3 ]
then 
	echo "wrong nubmer of arguments. Input 3"
	exit 1
fi
echo "$1*X + $2 = $3"
echo "X = $(my_math ${@})"

