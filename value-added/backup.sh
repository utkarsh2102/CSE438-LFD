#!/bin/bash

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
