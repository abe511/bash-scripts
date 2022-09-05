#!/bin/bash
if [ $# -gt 0 ]
then
	filepath=$1
else
	read filepath
fi
if test -f $filepath
then
	echo "$filepath exists."
	if test -w $filepath
	then
		echo "You have permissions to edit $filepath."
	else
		echo "You do NOT have permissions to edit $filepath."
	fi
else
	echo "$filepath does not exist."
fi
