#!/bin/bash
#subtask 4.9.7
echo "======================"
echo "Task 4.9.7:"
echo "CommandLine: $0 ${@}"
if [ $# -gt 2 ]
then
	echo "Error: more then 2 arguments"
else
	if [ $1 -gt $2 ]
	then echo $1;
	else
		if [ $1 -eq $2 ];
	     	then echo "="
	     	else echo $2
	     	fi
	fi
fi
