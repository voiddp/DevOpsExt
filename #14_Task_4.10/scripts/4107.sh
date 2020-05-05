#!/bin/bash
#SubTask 4.10.7
#script to monitor /etc/passwd
set -e
logdir="$HOME/tmp/scripts"
logfile="4107_usr.log"
cutfile="4107_psd.cut"
while :		# MAIN LOOP
do		# MAIN LOOP

declare -A oldById
declare -A newById
#####checking dir structure and cut file
[ -d $logdir ] || mkdir -p $logdir
[ -f "$logdir/$cutfile" ] || $(cat /etc/passwd | awk -F: '{print $3":"$1}' | sort -n > "$logdir/$cutfile")

####### cut file to array ############
for each in $(cat "$logdir/$cutfile")
do
	oldById[$(echo $each | cut -d: -f1)]=$(echo $each | cut -d: -f2)
done

####### system file to array ##########
for each in $(cat /etc/passwd | cut -d: -f1,3)
do
        newById[$(echo $each | cut -d: -f2)]=$(echo $each | cut -d: -f1)
done

newcut=0
tab=$'\t'
######## new records check ##############
for uid in ${!newById[@]}
do
	if [[ "${newById[$uid]}" != "${oldById[$uid]}" ]]
		then
                echo "$(date '+%D %T')${tab}ADD${tab}${uid}${tab}${newById[$uid]}" >> "$logdir/$logfile"
		newcut=1
	fi
done
####### old record check ###############
for uid in ${!oldById[@]}
do
        if [[ "${oldById[$uid]}" != "${newById[$uid]}" ]]
                then
                echo "$(date '+%D %T')${tab}DEL${tab}${uid}${tab}${oldById[$uid]}" >> "$logdir/$logfile"
                newcut=1
        fi
done

#reload cut file on changes
if [ $newcut = 1 ]
then
	cat /etc/passwd | awk -F: '{print $3":"$1}' | sort -n > "$logdir/$cutfile"
fi
unset newById
unset oldById
sleep 30 	#MAIN LOOP SLEEP
done 		#MAIN LOOP END
