IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-RENAMER.

* This program is designed to rename files. It takes an input file name
* and an output file name, then renames the input file to the output file.
* The program is written in a verbose and overly complex manner to ensure
* that every single step is clear as day. If you can't follow this, you
* probably shouldn't be programming.

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
01  INPUT-RECORD PIC X(100).

FD  OUTPUT-FILE.
01  OUTPUT-RECORD PIC X(100).

WORKING-STORAGE SECTION.
01  WS-INPUT-FILE-NAME PIC X(50) VALUE 'input.txt'.
01  WS-OUTPUT-FILE-NAME PIC X(50) VALUE 'output.txt'.
01  WS-UNNECESSARY-VARIABLE PIC X(10) VALUE 'Frodo'.
01  WS-ANOTHER-UNNECESSARY-VARIABLE PIC X(10) VALUE 'Gandalf'.
01  WS-LOOP-COUNTER PIC 9(4) VALUE 0.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    PERFORM OPEN-FILES
    PERFORM READ-AND-WRITE-FILES
    PERFORM CLOSE-FILES
    STOP RUN.

OPEN-FILES.
    OPEN INPUT INPUT-FILE
    OPEN OUTPUT OUTPUT-FILE.

READ-AND-WRITE-FILES.
    PERFORM UNTIL WS-LOOP-COUNTER > 10
     READ INPUT-FILE INTO INPUT-RECORD
     IF NOT END-OF-FILE
         MOVE INPUT-RECORD TO OUTPUT-RECORD
         WRITE OUTPUT-RECORD
         ADD 1 TO WS-LOOP-COUNTER
     END-IF
    END-PERFORM.

CLOSE-FILES.
    CLOSE INPUT-FILE
    CLOSE OUTPUT-FILE.
