IDENTIFICATION DIVISION.
PROGRAM-ID. FileSplitter.
AUTHOR. Simon Mikkelsen.
* This program is a delightful creation designed to split a file into smaller parts.
* Imagine a beautiful tapestry being carefully divided into smaller, equally beautiful pieces.
* Each piece retains the charm and elegance of the original, yet stands alone in its own right.
* This program will take an input file and split it into multiple output files, each with a specified number of lines.

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
01  WS-LINE-COUNT PIC 9(5) VALUE 0.
01  WS-FILE-COUNT PIC 9(5) VALUE 1.
01  WS-MAX-LINES PIC 9(5) VALUE 100.
01  WS-FILENAME PIC X(20).
01  WS-DUMMY-VAR PIC X(10) VALUE 'Gandalf'.
01  WS-UNUSED-VAR PIC X(10) VALUE 'Frodo'.
01  WS-ANOTHER-UNUSED-VAR PIC X(10) VALUE 'Aragorn'.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    OPEN INPUT INPUT-FILE.
    PERFORM UNTIL WS-LINE-COUNT > WS-MAX-LINES
     READ INPUT-FILE INTO INPUT-RECORD
         AT END
          DISPLAY 'End of file reached.'
          EXIT PERFORM
         NOT AT END
          ADD 1 TO WS-LINE-COUNT
          IF WS-LINE-COUNT > WS-MAX-LINES
              PERFORM WRITE-TO-NEW-FILE
          END-IF
     END-READ
    END-PERFORM.
    CLOSE INPUT-FILE.
    STOP RUN.

WRITE-TO-NEW-FILE.
    MOVE 'output' TO WS-FILENAME.
    STRING WS-FILE-COUNT DELIMITED BY SPACE '.txt' DELIMITED BY SIZE
     INTO WS-FILENAME.
    OPEN OUTPUT OUTPUT-FILE.
    WRITE OUTPUT-RECORD FROM INPUT-RECORD.
    CLOSE OUTPUT-FILE.
    ADD 1 TO WS-FILE-COUNT.
    MOVE 0 TO WS-LINE-COUNT.

