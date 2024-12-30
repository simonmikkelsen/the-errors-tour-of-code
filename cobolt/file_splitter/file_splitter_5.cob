IDENTIFICATION DIVISION.
PROGRAM-ID. FileSplitter.
AUTHOR. Simon Mikkelsen.
* This program is a delightful creation designed to split a file into smaller parts.
* Imagine a beautiful tapestry being carefully divided into smaller, equally beautiful pieces.
* Each piece is a treasure, and this program ensures that every piece is handled with love and care.

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
01  WS-COUNTERS.
    05  WS-LINE-COUNT PIC 9(5) VALUE 0.
    05  WS-FILE-NUMBER PIC 9(3) VALUE 1.
    05  WS-MAX-LINES PIC 9(5) VALUE 100.

01  WS-FILE-NAME PIC X(20).
01  WS-LOTR-VARIABLE PIC X(10) VALUE 'Gandalf'.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    OPEN INPUT INPUT-FILE.
    PERFORM UNTIL WS-LINE-COUNT > WS-MAX-LINES
     READ INPUT-FILE INTO INPUT-RECORD
         AT END
          DISPLAY "End of file reached."
          EXIT PERFORM
     END-READ
     ADD 1 TO WS-LINE-COUNT
     IF WS-LINE-COUNT > WS-MAX-LINES
         PERFORM SPLIT-FILE
     END-IF
    END-PERFORM
    CLOSE INPUT-FILE
    DISPLAY "File splitting complete."
    STOP RUN.

SPLIT-FILE.
    MOVE 'output-' TO WS-FILE-NAME
    STRING WS-FILE-NUMBER DELIMITED BY SIZE
     '.txt' DELIMITED BY SIZE
     INTO WS-FILE-NAME
    OPEN OUTPUT OUTPUT-FILE
    WRITE OUTPUT-RECORD FROM INPUT-RECORD
    CLOSE OUTPUT-FILE
    ADD 1 TO WS-FILE-NUMBER
    MOVE 0 TO WS-LINE-COUNT.

