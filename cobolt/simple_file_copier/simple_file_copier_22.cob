IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-COPIER.
AUTHOR. SIMON MIKKELSEN.

* This program copies the contents of one file to another.
* It is designed to be a simple example of file handling in COBOL.
* The program reads from an input file and writes to an output file.
* It demonstrates basic file operations and error handling.
* The program is verbose and uses a lot of variables and functions.

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
01  WS-EOF-FLAG PIC X VALUE 'N'.
    88  WS-EOF VALUE 'Y'.
01  WS-UNNECESSARY-VAR PIC X(10) VALUE 'UNNECESSARY'.
01  WS-ANOTHER-UNNECESSARY-VAR PIC X(10) VALUE 'ANOTHER'.
01  WS-FRODO PIC X(10).
01  WS-SAM PIC X(10).
01  WS-TEMP PIC X(100).

PROCEDURE DIVISION.
MAIN-PARA.
    PERFORM INITIALIZE-VARS
    OPEN INPUT INPUT-FILE
    OPEN OUTPUT OUTPUT-FILE
    PERFORM UNTIL WS-EOF
     READ INPUT-FILE INTO WS-TEMP
         AT END
          SET WS-EOF TO TRUE
     END-READ
     IF NOT WS-EOF
         MOVE WS-TEMP TO OUTPUT-RECORD
         WRITE OUTPUT-RECORD
     END-IF
    END-PERFORM
    CLOSE INPUT-FILE
    CLOSE OUTPUT-FILE
    PERFORM CLEANUP
    STOP RUN.

INITIALIZE-VARS.
    MOVE 'FRODO' TO WS-FRODO
    MOVE 'SAM' TO WS-SAM
    DISPLAY 'Initialization complete.'.

CLEANUP.
    DISPLAY 'Cleanup complete.'.

