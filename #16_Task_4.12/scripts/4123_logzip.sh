#!/bin/bash
#Cron task to archive set of files\directories
outfolder=~/tmp/scripts/4123Gzip
files=(\
~/memory/stat\
 ~/tmp/scripts/4123logs/vmstat\
 ~/tmp/scripts/4123logs/ld_avrg\
 ~/tmp/scripts/4123logs/mempages\
 ~/tmp/scripts/4123logs/hdd\
)
tar -czf $outfolder/$(date '+%d%m%Y_%H%M%S')_stats.tar.gz ${files[@]}
##removing log files each 5 mins in this homework to not leave long junk files
rm ${files[@]}
