#!/bin/sh

# USAGE: ./backup.sh <log_filename>

SRC="work"
DEST="backup"
TIMEDATE="$(date +"%x %r %Z")"

if [ -z "$1" ]
then
    echo "provide a log file name"
    exit 1
else
    LOG=$1
fi

main () {
    rm -f $LOG
    echo "$TIMEDATE creating backup directory.." >> "$LOG" && mkdir -p $DEST
}

main

trap "rm -rf $DEST && echo '$TIMEDATE backup cancelled by user' >> $LOG; exit 1" INT

echo "$TIMEDATE copiyng files.." >> "$LOG"
list=$(ls $SRC)
for f in $list; do
    cp -v $SRC/$f $DEST/"$f".bak >> $LOG 2>&1
done
echo "$TIMEDATE  backup complete" >> "$LOG"
exit 0

