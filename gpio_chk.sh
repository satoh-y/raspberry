#!/bin/sh

while true
do

isAlive=`ps auwx | grep "Ccandle" | grep -v grep | wc -l`

if [ $isAlive = 0 ]; then
 /Script/exec/Ccandle.py &
else
 echo $isAlive
fi

sleep 10
done

