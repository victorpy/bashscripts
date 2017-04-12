#!/bin/sh
PROCESS="asterisk"
PID=`pgrep $PROCESS | tail -n 1`
#echo $PID
CPU=`top -b -p 2984 -n 1 | grep asterisk | awk '{print $9}'`
#echo $CPU
CPU2=${CPU/.*}

if [ "$CPU2" -lt "90" ]; then
        echo "less than 90"
else
        echo "bigger than 90"
        `/usr/sbin/asterisk -rx "core restart now"`
fi
