#!/usr/bin/env python

##from timeout import on_timeout

import RPi.GPIO as GPIO
import commands 
import time 

import eventlet
eventlet.monkey_patch()
from eventlet.timeout import Timeout
from goto import goto, label

###GPIO.cleanup()

GPIO.setmode(GPIO.BCM)
GPIO.setup(6, GPIO.IN)

##while True:
## print( GPIO.input(6))
##  time.sleep(0.5)

if __name__ == '__main__':
 while True:
  print "L1"
  ###sensorValue = GPIO.input(6)
  try:
        sensorValue = GPIO.input(6)
        print "L2"
        with Timeout(5):
           c = 0
           while c < 5:
             print "L3"
             print(c)
             if (sensorValue is 1):
                 c +=1
                 time.sleep(1)
                 ###break
                 print(GPIO.input(6))
                 print(c)
             else:
                 c +=5
                 time.sleep(0.1)
                 print(c)
                 ##break
                 ##goto .END
                 ##label .END
  except Timeout:
   print('Over the time limit')
   time.sleep(1)
    ##commands.getoutput('sudo /Script/exec/shutdown.sh')
