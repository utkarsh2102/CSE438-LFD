#!/bin/bash

# Written by Utkarsh Gupta <utkarsh@debian.org>

current_dir="$(dirname "$0")"

@test "Un-edited phrases in the OldSyllabusLinuxForDevices.txt file" {
  result="$(grep "Shell script" OldSyllabusLinuxForDevices.txt | wc -l)"
  [ "$result" -eq 4 ]
}

@test "Post-editing the phrases using the syllabus_editing.sh script" {
  result="$(grep "Shell script" SyllabusLinuxForDevices.txt | wc -l)"
  [ "$result" -eq 0 ]
}
