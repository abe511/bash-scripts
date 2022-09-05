#!/bin/sh

# USAGE: solution-a2.1.sh <test file name>

if [ -z "$1" ]
then
    echo "provide a test file name"
    exit 1
else
    TESTFILE=$1
fi


while read -r line
do
    echo $line
done < $TESTFILE
