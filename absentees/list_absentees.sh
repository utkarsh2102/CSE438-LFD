#!/bin/bash

# Written by Utkarsh Gupta <utkarsh@debian.org>

# 8<---8<---8<---8<---8<---8<---8<---8<---8<---8<---8<---8<---8<---8<---8<
#
# Instruction on running this script:
# Hello, this script generates the list of absentees from
# the given two lists:
# 1) The total list of students.
# 2) The students present in today's meeting.
#
# Here's how you should run the script:
# ./list_absentees.sh $students_list $in_meeting_list
#
# For example:
# $ ./list_absentees.sh Students\ List\ -\ Copy.xlsx meetingAttendanceList.csv
#
# NOTE:
# 1. The first argument should be the Students List.
# 2. The second argument should be the meetingAttendanceList.
#
# 8<---8<---8<---8<---8<---8<---8<---8<---8<---8<---8<---8<---8<---8<---8<

# enable this for debugging
# set -ex

# rename the file to trim spaces
studentsList=$(echo "$1" | sed 's/ /_/g')
cp "$1" "$(echo "$1" | sed 's/ /_/g')"

# conversion of files
xlsx2csv --all $studentsList > studentsList.csv
sed -i '/^--------/d' studentsList.csv

# remove the first line and sort the student's names in order
sed '1,1d' studentsList.csv > names_students.csv
cat names_students.csv | awk -F"," '{ print $4 }' | sort > sorted_students.csv

# change encoding of the csv file
iconv -f utf-16 -t utf-8 $2 > meetingAttendance.csv

# remove the first two lines and sort the presentees' names in order
sed '1,2d' meetingAttendance.csv > names_presentees.csv
cat names_presentees.csv | tr "\t" "," | awk -F',' '{ print $1 }' | uniq | sort > sorted_presentees.csv

# using comm (from coreutils package) to compare the two sorted files
echo "The name of the absentees are:"
echo "8<---8<---8<---8<---8<---8<"
comm -13 sorted_presentees.csv sorted_students.csv
echo "8<---8<---8<---8<---8<---8<"

# clear up all the generated files
rm $studentsList studentsList.csv meetingAttendance.csv
rm names_presentees.csv names_students.csv
rm sorted_presentees.csv sorted_students.csv
