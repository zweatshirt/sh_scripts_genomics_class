#!/usr/bin/env bash

# This script lists all the directories of the current directory
# and stores the list in a file named output.txt

out="output.txt"
stars="*****************************"
if [ ! -f "$PWD/output.txt" ];
then

	while true;
	do

	read -p "Do you want to make an output file of the list of dirs in the pwd? [y/n] " yn
	case "$yn" in
		Y|y )
			echo "$stars" >> "$PWD/$out"
			ls "$PWD" >> "$PWD/$out"
			break;;
	
		N|n )
			echo "Alright then..."
			break;;
		*  )
			echo "That's not valid, try again.";;

	esac
	done
else
	echo "Updating $PWD/$out"
	touch $out
	echo "**********************" >> "$PWD/$out"
	ls "$PWD" >> "$PWD/$out"
fi

