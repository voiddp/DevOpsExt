#!/bin/bash -r
##Task 4.11.7
echo ================
cd .. || echo "script works in resticted mode in directory: $(pwd)"

if [ $# -lt 2 ];then
	echo "Input at least 2 arguments:"
	echo "$0 text file [#rows]"
	exit 1
fi
text=$1;file=$2;n=1
if [ -z $3 ]; then maxrows=0; else maxrows=$3; fi
echo "4.11.7 output:"
grep "$text" $file | sort -r | while read -r row
do
	echo "$n: $row"
	if [ $n -eq $maxrows ];	then break; fi
        (( n++ ))
done; exit 0
