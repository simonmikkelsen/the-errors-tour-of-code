IDENTIFICATION DIVISION.
PROGRAM-ID. FileSplitter.
AUTHOR. Simon Mikkelsen.
* This program is a delightful creation designed to split a file into smaller parts.
* It is crafted with love and care to help you manage large files with ease.
* Imagine a world where you can handle gigantic files effortlessly, breaking them down into manageable pieces.
* This program is your magical tool to achieve that!

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
01  MAX-LINES PIC 9(4) VALUE 100.
01  FILE-NAME PIC X(20).
01  TEMP-VAR PIC X(100).
01  GANDALF PIC X(100).
01  FRODO PIC X(100).
01  SAM PIC X(100).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    OPEN INPUT INPUT-FILE.
    PERFORM UNTIL FILE-COUNTER > 10
     MOVE 'output-' TO FILE-NAME
     STRING FILE-COUNTER DELIMITED BY SIZE '.txt' DELIMITED BY SIZE INTO FILE-NAME
     OPEN OUTPUT OUTPUT-FILE
     PERFORM UNTIL LINE-COUNTER >= MAX-LINES
         READ INPUT-FILE INTO INPUT-RECORD
         AT END
          CLOSE OUTPUT-FILE
          MOVE 0 TO LINE-COUNTER
          ADD 1 TO FILE-COUNTER
          EXIT PERFORM
         NOT AT END
          MOVE INPUT-RECORD TO OUTPUT-RECORD
          WRITE OUTPUT-RECORD
          ADD 1 TO LINE-COUNTER
     END-PERFORM
     CLOSE OUTPUT-FILE
    END-PERFORM
    CLOSE INPUT-FILE
    DISPLAY 'File splitting completed successfully!'
    STOP RUN.