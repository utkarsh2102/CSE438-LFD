#!/bin/zsh

# Written by Utkarsh Gupta <utkarsh@debian.org>

# Instructions to run:
#
# Run this script along with the service as a command-line
# argument that you want to check if it's running or not.
# ./is_service_running.sh $name_of_the_service
#
# For example:
# $ ./is_service_running.sh bluetooth

# uncomment for debugging
# set -ex

function startService {
  echo -n "Want to start the service? "
  read choice
  if [[ $choice == "y" ]]
  then
    systemctl start $service
  else
    echo "OK, exiting."
  fi
}

service=$1
systemctl is-active --quiet $service

if [[ $? -eq 0 ]]
then
  echo "$service is running!"
else
  echo "$service is *not* running!"
  startService
fi
