#!/bin/bash
touch /tmp/log.txt
while read -p "$USER@$HOSTNAME: " log
do
	echo $(date "+%Y.%m.%d %H:%M:%S") $USER: $log >>/tmp/log.txt
	eval $log
done
