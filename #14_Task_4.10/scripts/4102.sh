#!/bin/bash
#SubTask 4.10.2
dir=/home/user/tmp
logfile=4102_ps.log
set -e
while :
do
	[ -d ${dir} ] || mkdir -p /home/user/tmp
	echo $(date '+%T %D')$'\t'"processes count:"$'\t'$(ps aux --no-heading | wc -l) >> ${dir}/${logfile}
	sleep 60
done
