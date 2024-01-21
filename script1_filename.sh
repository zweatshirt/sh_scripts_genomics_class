#!/usr/bin/env bash


# simple make dir script

read -p "Name your new directory, it'll show up in your current working directory: " new_dir
mkdir "$PWD/$new_dir"
