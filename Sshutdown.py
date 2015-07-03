#!/usr/bin/env python

import RPi.GPIO as GPIO
import commands
import time

GPIO.cleanup()

GPIO.setmode(GPIO.BCM)
GPIO.setup(6, GPIO.IN)

while True:
 inputValue = GPIO.input(6)
 if (inputValue == 1):
   commands.getoutput('sudo /Script/exec/shutdown.sh')
 else:
   pass
