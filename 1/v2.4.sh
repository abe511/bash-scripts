#!/bin/sh

# USAGE: solution-a2.1.sh <key word> <test file names>

if [ "$#" -lt 1 ]
then
    echo "provide a key word"
    exit 1
fi


if [ $# -lt 2 ]
then
    echo "provide test file names"
    exit 1
fi


for arg in $@
do
    if [ -z $WORD ]; then
        WORD=$arg
    else
        count=0
        while read field1
        do
            count=$((count+1))
            if [ "$field1" = "$WORD" ];
            then
                echo $count $field1
            fi
        done < $arg
    fi
done

exit 0


