#!/bin/bash

logfile=$1

echo "Creating backup directory" >> /$HOME/$logfile
mkdir /$HOME/work_backup

echo "Copying Files" >> /$HOME/$logfile
cp -v /$HOME/work/* /$HOME/work_backup/ >> /$HOME/$logfile
echo "Finished Copying Files" >> /$HOME/$logfile