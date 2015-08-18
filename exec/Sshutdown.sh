#!/bin/sh

GPIO=6
TIMER=3

echo "$GPIO" > /sys/class/gpio/export
echo "in" > /sys/class/gpio/gpio$GPIO/direction

cnt=0

while [ $cnt -lt $TIMER ] ; do
  sensor=`cat /sys/class/gpio/gpio$GPIO/value`
  if [ "$sensor" -eq "1" ] ; then
    cnt=`expr $cnt + 1`
  else
    cnt=0
  fi
  sleep 1
done


sync
sync

shutdown -h now
