#!/usr/bin/env bash

# This program is very simple: it makes a directory with your choice of name.

read -p "Name your directory: " dir


if [ ! -d "$PWD/$dir" ];
	then
        	mkdir "$PWD/$dir"
  	else
         	echo "Directory $dir already exists"
fi
