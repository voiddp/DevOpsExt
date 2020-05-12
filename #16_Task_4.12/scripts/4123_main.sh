#!/bin/bash
logdir=~/tmp/scripts/4123logs

#vmstat stats, for 30s, skip 1st line with avr from uptime
sum=0
#sleep 1
for cs in $(vmstat -w 1 11 | tail -n 10 | awk '{print $12}')
   do
     ((sum+=cs))
   done;
echo "$(date '+%D %T') CS(-30/3s_avrg): $((sum/10))" >> $logdir/vmstat

#load_average - top
echo "$(date '+%D %T') load_average_15m: $(uptime | awk '{print $10}')" >> $logdir/ld_avrg

#memory state to log file
echo "=================================================" >> $logdir/mempages
echo "$(date '+%D %T') state of /proc/meminfo" >> $logdir/mempages
echo "=================================================" >> $logdir/mempages
cat /proc/meminfo >> $logdir/mempages


#disk state to log file
echo "================================================" >> $logdir/hdd
echo "$(date '+%D %T') state of HDD volumes" >> $logdir/hdd
echo "================================================" >> $logdir/hdd
df >> $logdir/hdd
