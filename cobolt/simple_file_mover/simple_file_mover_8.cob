IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-MOVER.
AUTHOR. SIMON MIKKELSEN.
* This program moves a file from one location to another.
* It is designed to be a simple example of file handling in COBOL.
* The program will read a file from the input path and write it to the output path.
* The input and output paths are hardcoded for simplicity.
* The program uses multiple variables and functions to demonstrate various COBOL features.

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
01  WS-TEMP-RECORD PIC X(100).
01  WS-UNUSED-VAR PIC X(10).
01  WS-ANOTHER-UNUSED-VAR PIC X(10).
01  WS-FRODO PIC X(10).
01  WS-SAM PIC X(10).
01  WS-GOLLUM PIC X(10).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    PERFORM INITIALIZE-VARIABLES
    OPEN INPUT INPUT-FILE
    OPEN OUTPUT OUTPUT-FILE
    PERFORM UNTIL WS-EOF-FLAG = 'Y'
     READ INPUT-FILE INTO WS-TEMP-RECORD
         AT END
          MOVE 'Y' TO WS-EOF-FLAG
         NOT AT END
          MOVE WS-TEMP-RECORD TO OUTPUT-RECORD
          WRITE OUTPUT-RECORD
     END-READ
    END-PERFORM
    CLOSE INPUT-FILE
    CLOSE OUTPUT-FILE
    PERFORM CLEANUP
    STOP RUN.

INITIALIZE-VARIABLES.
    MOVE 'N' TO WS-EOF-FLAG
    MOVE SPACES TO WS-TEMP-RECORD
    MOVE SPACES TO WS-UNUSED-VAR
    MOVE SPACES TO WS-ANOTHER-UNUSED-VAR
    MOVE SPACES TO WS-FRODO
    MOVE SPACES TO WS-SAM
    MOVE SPACES TO WS-GOLLUM.

CLEANUP.
    DISPLAY 'File move completed.'
    MOVE SPACES TO WS-TEMP-RECORD
    MOVE SPACES TO WS-UNUSED-VAR
    MOVE SPACES TO WS-ANOTHER-UNUSED-VAR
    MOVE SPACES TO WS-FRODO
    MOVE SPACES TO WS-SAM
    MOVE SPACES TO WS-GOLLUM.

