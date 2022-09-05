#!/bin/sh

# USAGE: ./backup.sh <src_dir> <dest_dir> [log_filename]

if [ -z "$1" ]
    then echo "provide the source dir name"
    exit 1
fi

if [ -z "$2" ]
    then echo "provide the destination dir name"
    exit 1
fi

if [ -z "$3" ]
then
    log=backup.log
else
    log=$3
fi

echo "backup process started" >> "$log"
echo "creating backup directory.." >> "$log"
mkdir $2
echo "copiyng files.." >> "$log"
cp --verbose $1/* $2 >> "$log"
echo "backup process complete" >> "$log"
