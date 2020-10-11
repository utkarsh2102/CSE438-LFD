## Pre-requisites

- You should have `docx2txt` installed.  
  For Debian-based systems, you can install it via `sudo apt install docx2txt`.

## How to Run the Script

- You can run the binary `syllabus_editing.sh` with a command-line arguement,
  giving the `.docx` file which is to be edited.

- If you have `docx2txt` installed, the new `SyllabusLinuxForDevices.txt` will
  have been created. Otherwise, the error message will be shown.

## Running Tests

You can run the tests for the script using the `test_syllabus_editing.sh` file.  
You should have `bats` installed on your system.

Here's how you can run the tests:
```
$ bats test_syllabus_editing.sh
 ✓ Un-edited phrases in the OldSyllabusLinuxForDevices.txt file
 ✓ Post-editing the phrases using the syllabus_editing.sh script

2 tests, 0 failures
```

## Author

Written by Utkarsh Gupta <<utkarsh@debian.org>>.  
Enrollment Number: A2305217557.  
Batch: 7CSE-8Y (2017-21).
