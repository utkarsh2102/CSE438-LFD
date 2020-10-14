#!/bin/zsh

# Written by Utkarsh Gupta <utkarsh@debian.org>

# Intructions to run:
#
# Run this script with a path to directory as a
# command-line argument.
# ./count_files.sh $path_to_some_directory
#
# For example:
# $ ./count_files.sh /etc/grub.d

# uncomment for debugging
# set -ex

if [ -d "$1" ]
then
  ls $1 | wc -l
else
  echo "No such directory named $1"
fi
