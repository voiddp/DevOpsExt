#!/bin/bash
#cron task for memory stats
echo "$(date '+%D %T') $(free | grep Mem)" >> ~/memory/stat
