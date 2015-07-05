#!/bin/sh

while true
do

isAlive=`ps auwx | grep "Ccandle.py" | grep -v grep | wc -l`

if [ $isAlive = 1 ]; then
 echo $isAlive
else
 /Script/exec/Ccandle.py &
fi

sleep 10
done

