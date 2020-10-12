#!/bin/bash

# Written by Utkarsh Gupta <utkarsh@debian.org>

# remove the first two lines and sort the presentees' names in order
sed '1,2d' meetingAttendanceList.csv > names_presentees.csv
cat names_presentees.csv | tr "\t" "," | awk -F',' '{ print $1 }' | uniq | sort > sorted_presentees.csv

# remove the first line and sort the student's names in order
sed '1,1d' studentsList.csv > names_students.csv
cat names_students.csv | awk -F"," '{ print $4 }' | sort > sorted_students.csv

# using comm (from coreutils package) to compare the two sorted files
echo "The name of the absentees are:"
echo "8<---8<---8<---8<---8<---8<"
comm -13 sorted_presentees.csv sorted_students.csv
echo "8<---8<---8<---8<---8<---8<"

# clear up all the generated files
rm names_presentees.csv names_students.csv
rm sorted_presentees.csv sorted_students.csv
