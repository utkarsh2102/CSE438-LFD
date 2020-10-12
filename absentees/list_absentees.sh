#!/bin/bash

# Written by Utkarsh Gupta <utkarsh@debian.org>

sed '1,2d' meetingAttendanceList.csv > names_presentees.csv
cat names_presentees.csv | tr "\t" "," | awk -F',' '{ print $1 }' | uniq | sort > sorted_presentees.csv

sed '1,1d' studentsList.csv > names_students.csv
cat names_students.csv | awk -F"," '{ print $4 }' | sort > sorted_students.csv

echo "The name of the absentees are:"
echo "8<---8<---8<---8<---8<---8<"
comm -13 sorted_presentees.csv sorted_students.csv
echo "8<---8<---8<---8<---8<---8<"

rm names_presentees.csv names_students.csv
rm sorted_presentees.csv sorted_students.csv
