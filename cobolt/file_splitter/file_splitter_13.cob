IDENTIFICATION DIVISION.
PROGRAM-ID. FILE-SPLITTER.
AUTHOR. Simon Mikkelsen.
* Ahoy, matey! This be a program to split files into smaller pieces.
* It be a fine day to sail the seas of code and learn the ways of file handling.
* This program will take a large file and split it into smaller files for easier management.
* We be using global variables to keep track of our progress and share information across the program.
* So hoist the sails and let's get started!

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT INPUT-FILE ASSIGN TO 'input.txt'
     ORGANIZATION IS LINE SEQUENTIAL.
    SELECT OUTPUT-FILE ASSIGN TO 'output.txt'
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  INPUT-FILE.
01  INPUT-RECORD PIC X(80).

FD  OUTPUT-FILE.
01  OUTPUT-RECORD PIC X(80).

WORKING-STORAGE SECTION.
01  WS-GLOBAL-VARIABLES.
    05  WS-INPUT-FILE-NAME PIC X(50) VALUE 'input.txt'.
    05  WS-OUTPUT-FILE-NAME PIC X(50) VALUE 'output.txt'.
    05  WS-CHUNK-SIZE PIC 9(4) VALUE 100.
    05  WS-CURRENT-LINE PIC 9(4) VALUE 0.
    05  WS-FILE-COUNTER PIC 9(4) VALUE 1.
    05  WS-TEMP-VARIABLE PIC X(10) VALUE 'Gandalf'.
    05  WS-UNUSED-VARIABLE PIC X(10) VALUE 'Frodo'.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    OPEN INPUT INPUT-FILE.
    OPEN OUTPUT OUTPUT-FILE.
    PERFORM UNTIL WS-CURRENT-LINE > WS-CHUNK-SIZE
     READ INPUT-FILE INTO INPUT-RECORD
         AT END
          DISPLAY 'End of file reached.'
          EXIT PERFORM
     END-READ
     MOVE INPUT-RECORD TO OUTPUT-RECORD
     WRITE OUTPUT-RECORD
     ADD 1 TO WS-CURRENT-LINE
    END-PERFORM.
    CLOSE INPUT-FILE.
    CLOSE OUTPUT-FILE.
    DISPLAY 'File splitting complete. Have a lovely day!'.
    STOP RUN.

