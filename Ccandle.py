#!/usr/bin/env python

import RPi.GPIO as GPIO
import time

GPIO.cleanup()

GPIO.setmode(GPIO.BCM)
GPIO.setup(4, GPIO.IN)
GPIO.setup(17, GPIO.OUT)
GPIO.setup(27, GPIO.OUT)
GPIO.setup(22, GPIO.OUT)


##while True:
## print( GPIO.input(17))
## time.sleep(0.5)


while True:
 inputValue = GPIO.input(4)
 if (inputValue == 1):
   GPIO.output(17, GPIO.HIGH)
   GPIO.output(27, GPIO.HIGH)
   GPIO.output(22, GPIO.HIGH)
   time.sleep(1)
   GPIO.output(17, GPIO.LOW)
   GPIO.output(27, GPIO.LOW)
   GPIO.output(22, GPIO.LOW)
else:
   GPIO.output(4, GPIO.LOW)
   GPIO.output(27, GPIO.LOW)
   GPIO.output(22, GPIO.LOW)

