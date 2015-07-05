#!/bin/sh

STATUS=`exec /etc/init.d/webiopi status`
echo $STATUS | grep failed > /dev/null
if [ $? -eq 0 ]; then
	exec /etc/init.d/webiopi start
else
	echo $STATUS
fi

