#!/bin/bash

# Written by Utkarsh Gupta <utkarsh@debian.org>

# take the .docx file as a commond-line arguement.
docxFile=$1

# to convert the given .docx file to the .txt file for easy text manipulation.
docx2txt $docxFile SyllabusLinuxForDevices.txt

# changing the phrase "Shell script" to "Write a shell script" using sed.
sed -i 's/Shell script/Write a shell script/g' SyllabusLinuxForDevices.txt
