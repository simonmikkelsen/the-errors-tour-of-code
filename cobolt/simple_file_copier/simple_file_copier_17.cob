IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-COPIER.
AUTHOR. SIMON MIKKELSEN.
* This program is designed to copy the contents of one file to another.
* It is a simple file copier that demonstrates basic file handling in COBOL.
* The program reads from an input file and writes to an output file.
* It also includes various unnecessary variables and functions for no apparent reason.

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
01  WS-EOF PIC X VALUE 'N'.
01  WS-COUNTER PIC 9(5) VALUE 0.
01  WS-TEMP PIC X(100).
01  WS-RANDOM-FILE PIC X(100) VALUE 'random.txt'.
01  WS-RANDOM-RECORD PIC X(100).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    OPEN INPUT INPUT-FILE
    OPEN OUTPUT OUTPUT-FILE
    PERFORM UNTIL WS-EOF = 'Y'
     READ INPUT-FILE INTO INPUT-RECORD
         AT END
          MOVE 'Y' TO WS-EOF
         NOT AT END
          MOVE INPUT-RECORD TO OUTPUT-RECORD
          WRITE OUTPUT-RECORD
          ADD 1 TO WS-COUNTER
          IF WS-COUNTER MOD 5 = 0
              MOVE INPUT-RECORD TO WS-RANDOM-RECORD
              PERFORM WRITE-RANDOM-FILE
          END-IF
     END-READ
    END-PERFORM
    CLOSE INPUT-FILE
    CLOSE OUTPUT-FILE
    STOP RUN.

WRITE-RANDOM-FILE.
    OPEN OUTPUT RANDOM-FILE
    WRITE WS-RANDOM-RECORD
    CLOSE RANDOM-FILE.

