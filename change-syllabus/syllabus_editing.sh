#!/bin/bash

# Written by Utkarsh Gupta <utkarsh@debian.org>

# for installing docx2txt on Debian-based systems.
# if [ $(dpkg-query -W -f='${Status}' docx2txt 2>/dev/null | grep -c "ok installed") -eq 0 ];
# then
#   sudo apt install docx2txt;
# fi

# take the .docx file as a commond-line arguement.
docxFile=$1

# to convert the given .docx file to the .txt file for easy text manipulation.
docx2txt $docxFile SyllabusLinuxForDevices.txt

# error checking
if [[ $? != 0  ]]
then
  echo "Error has occured. Couldn't convert the $1 to a text file."
  exit 1
fi

# changing the phrase "Shell script" to "Write a shell script" using sed.
sed -i 's/Shell script/Write a shell script/g' SyllabusLinuxForDevices.txt

# tell the user that the editing has been done.
if [[ $? -eq 0  ]]
then
  echo "Editing done. You can see the newly created SyllabusLinuxForDevices.txt file."
else
  echo "Error has occured. Couldn't edit $1 file."
  exit 1
fi
