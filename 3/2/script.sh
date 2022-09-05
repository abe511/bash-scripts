#!/bin/bash
if [ $# -gt 0 ]; then
	path=$1
else
	path='./'
fi
grep -rl -e 'Apache License' -e 'Lesser General Public License' $path | sort
