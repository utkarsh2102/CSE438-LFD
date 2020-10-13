#!/bin/bash

# Written by Utkarsh Gupta <utkarsh@debian.org>

# Instructions for running:
#
# To run this shell script, just use this executable in the
# following way:
# $ ./backup.sh $path_to_directory
#
# For example:
# $ ./backup.sh /home/utkarsh/imp_data/

# uncomment for debugging
# set -ex

dest=$1
date=$(date "+%F")
user=$(whoami)
tarname="utkarsh_backup_$date.tar.gz"

# create a tar
tar -czf $tarname $dest

# send it to people.debian.org/~utkarsh
rsync -a $tarname utkarsh@people.debian.org:/home/utkarsh/public_html/backup

# check exit status
if [[ $? -eq 0  ]]
then
  echo "Backup created and uploaded to the server."
else
  echo "Error occured."
fi

# delete the file
rm $tarname
