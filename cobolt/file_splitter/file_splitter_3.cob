IDENTIFICATION DIVISION.
PROGRAM-ID. FileSplitter.
AUTHOR. Simon Mikkelsen.
* This program is a delightful little tool designed to split a file into smaller pieces.
* Imagine you have a large file, and you want to break it down into more manageable chunks.
* This program will help you achieve that with grace and elegance.
* It reads the input file, splits it into smaller files, and writes them to the disk.
* Let's embark on this journey together, shall we?

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
01  TEMP-VARIABLE PIC X(100).
01  GANDALF PIC X(100).
01  FRODO PIC X(100).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    OPEN INPUT INPUT-FILE.
    PERFORM UNTIL EOF
     READ INPUT-FILE INTO GANDALF
         AT END
          MOVE 'YES' TO EOF
     END-READ
     ADD 1 TO LINE-COUNTER
     IF LINE-COUNTER > MAX-LINES
         PERFORM CLOSE-AND-OPEN-NEW-FILE
     END-IF
     MOVE GANDALF TO OUTPUT-RECORD
     WRITE OUTPUT-RECORD
    END-PERFORM
    CLOSE INPUT-FILE OUTPUT-FILE
    STOP RUN.

CLOSE-AND-OPEN-NEW-FILE.
    CLOSE OUTPUT-FILE
    ADD 1 TO FILE-COUNTER
    MOVE 'output-' TO FILE-NAME
    STRING FILE-COUNTER DELIMITED BY SPACE INTO FILE-NAME
    STRING '.txt' DELIMITED BY SIZE INTO FILE-NAME
    OPEN OUTPUT OUTPUT-FILE
    MOVE 0 TO LINE-COUNTER.

