IDENTIFICATION DIVISION.
PROGRAM-ID. FileSplitter.
AUTHOR. Simon Mikkelsen.
* This program is a delightful creation designed to split a file into smaller parts.
* Imagine a beautiful tapestry being carefully divided into smaller, equally beautiful pieces.
* Each piece is a work of art, just like each part of the file will be.

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
01  FILE-COUNTER PIC 9(4) VALUE 1.
01  LINE-COUNTER PIC 9(4) VALUE 0.
01  MAX-LINES PIC 9(4) VALUE 10.
01  FILE-NAME PIC X(20).
01  TEMP-VARIABLE PIC X(10).
01  GOLLUM PIC X(10).
01  FRODO PIC X(10).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    OPEN INPUT INPUT-FILE.
    PERFORM UNTIL FILE-COUNTER > 5
     MOVE 'output' TO FILE-NAME
     STRING FILE-COUNTER DELIMITED BY SIZE INTO FILE-NAME
     MOVE '.txt' TO TEMP-VARIABLE
     STRING TEMP-VARIABLE DELIMITED BY SIZE INTO FILE-NAME
     OPEN OUTPUT OUTPUT-FILE
     PERFORM UNTIL LINE-COUNTER = MAX-LINES
         READ INPUT-FILE INTO INPUT-RECORD
         AT END
          CLOSE OUTPUT-FILE
          CLOSE INPUT-FILE
          STOP RUN
         NOT AT END
          WRITE OUTPUT-RECORD FROM INPUT-RECORD
          ADD 1 TO LINE-COUNTER
     END-PERFORM
     CLOSE OUTPUT-FILE
     ADD 1 TO FILE-COUNTER
     MOVE 0 TO LINE-COUNTER
    END-PERFORM
    CLOSE INPUT-FILE
    STOP RUN.