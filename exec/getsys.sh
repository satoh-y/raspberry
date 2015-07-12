#!/bin/sh

TODAY=`date '+%Y/%m/%d-%H:%M'`
INFOTXT=/home/pi/data/systeminfo.txt

: > $INFOTXT

echo $TODAY > $INFOTXT
 echo "-=-=- =-=-" >> $INFOTXT
df -h >> $INFOTXT
 echo "-=-=- =-=-" >> $INFOTXT
tail -10 /var/log/messages >> $INFOTXT

