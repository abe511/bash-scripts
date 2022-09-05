#!/bin/sh

# USAGE: solution-a2.1.sh <key word> <test file name>

if [ -z "$1" ]
then
    echo "provide a key word"
    exit 1
else
    WORD=$1
fi

if [ -z "$2" ]
then
    echo "provide a test file name"
    exit 1
else
    TESTFILE=$2
fi

count=0
while read field1
do
    count=$((count+1))
    if [ "$field1" = "$WORD" ];
    then
        echo $count $field1
    fi
done < $TESTFILE

exit 0

