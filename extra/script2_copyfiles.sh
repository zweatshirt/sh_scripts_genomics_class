#!/usr/bin/env bash

read -p "Please provide the absolute directory path of the files to be copied: " copy
read -p "Please provide the absolute directory path you'd like to paste the files in: " paste

cp -a $copy $paste

echo "Done!"
