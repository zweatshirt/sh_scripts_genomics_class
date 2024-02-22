#!/usr/bin/env bash

# Program that shows basics of flags and also outputs the etc dir to a text file.

SHARE_DIR="$PWD"
f1="-s"
f2="-c"

if [[ $# -lt 1 ]];
then 
	echo "Try again and enter two flags: -s for starting and -c for config"
	exit
fi

if [ "$1" = $f1 ];
then
	echo "starting the program"
fi

if [ "$2" = $f2 ];
then
	echo "config selected"
	
fi

echo "The first variable is $1 and second variable is $2"

ls /etc > $SHARE_DIR/etc_output.txt
