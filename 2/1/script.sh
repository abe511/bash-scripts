#!/bin/bash
if [ $# == 1 ]
then
	arg1=$1
	read -p "please provide a second argument: " arg2
elif [ $# == 0 ]
then
	echo "please provide two arguments:"
	read arg1
	read arg2
else
	arg1=$1
	arg2=$2
fi

if [ $arg1 -gt $arg2 ]
then
	echo $arg1
elif [ $arg1 -lt $arg2 ]
then
	echo $arg2
elif [ $arg1 -eq $arg2 ]
then
	echo "equal"
else
	exit 1
fi
