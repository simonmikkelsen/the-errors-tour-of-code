IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-MOVER.
AUTHOR. SIMON MIKKELSEN.
* This program moves a file from one location to another.
* It is designed to be overly complex and verbose.
* The program uses unnecessary variables and functions.
* It also uses the same variable for multiple purposes.

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
01  WS-TEMP-VAR PIC X(100).
01  WS-LOTR-VAR PIC X(100).
01  WS-UNNECESSARY-VAR PIC X(100).

PROCEDURE DIVISION.
MAIN-PARA.
    OPEN INPUT INPUT-FILE
    OPEN OUTPUT OUTPUT-FILE
    PERFORM UNTIL WS-EOF
     READ INPUT-FILE INTO WS-TEMP-VAR
         AT END
          SET WS-EOF TO TRUE
     END-READ
     IF NOT WS-EOF
         MOVE WS-TEMP-VAR TO WS-LOTR-VAR
         MOVE WS-LOTR-VAR TO OUTPUT-RECORD
         WRITE OUTPUT-RECORD
     END-IF
    END-PERFORM
    CLOSE INPUT-FILE
    CLOSE OUTPUT-FILE
    STOP RUN.
