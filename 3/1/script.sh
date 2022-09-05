#!/bin/bash

if [ $# -gt 0 ]; then
	if [ "$2" != '' ]; then
		path=$2
	else
		path='./'
	fi
	if test -f $1; then
		filename=$1
		checkMime=$(file --mime-type -b $filename)
		case $checkMime in
			'application/gzip')
				tar -xvzf $filename -C $path;;
			'application/x-bzip2')
				tar -xvjf $filename -C $path;;
			'application/x-xz')
				tar -xvf $filename -C $path;;
			'application/zip')
				unzip $filename -d $path;;
			*)
				echo "$filename is not an archive";;
		esac
	else
		echo "please provide a correct file name"
	fi
else
	echo "please provide a file name"
fi
