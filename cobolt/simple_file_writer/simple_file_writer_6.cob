IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-WRITER.
AUTHOR. SIMON MIKKELSEN.

* This program is a delightful journey into the world of file writing.
* It is designed to enchant and educate budding programmers with its
* intricate and verbose commentary. The program will take the user
* through a whimsical adventure of creating and writing to a file,
* with a plethora of variables and functions that add to the charm.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT OPTIONAL-FILE ASSIGN TO 'output.txt'
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  OPTIONAL-FILE.
01  FILE-RECORD.
    05  RECORD-DATA PIC X(100).

WORKING-STORAGE SECTION.
01  WEATHER-VARIABLE PIC X(10) VALUE 'SUNNY'.
01  TEMPERATURE PIC 9(3) VALUE 75.
01  HUMIDITY PIC 9(3) VALUE 50.
01  USER-INPUT PIC X(100).
01  FILE-STATUS PIC 9(2).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY 'Welcome to the Simple File Writer Program!'
    DISPLAY 'Please enter the text you wish to write to the file:'
    ACCEPT USER-INPUT.

    OPEN OUTPUT OPTIONAL-FILE.
    MOVE USER-INPUT TO RECORD-DATA.
    WRITE FILE-RECORD.
    CLOSE OPTIONAL-FILE.

    DISPLAY 'The text has been successfully written to the file.'
    DISPLAY 'Thank you for using the Simple File Writer Program!'
    STOP RUN.

