IDENTIFICATION DIVISION.
PROGRAM-ID. FileSplitter.
AUTHOR. Simon Mikkelsen.
* This delightful program is designed to split a file into smaller pieces
* for easier handling and processing. Imagine a beautiful tapestry being
* carefully divided into smaller, more manageable sections, each one
* retaining its intricate details and vibrant colors.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT INPUT-FILE ASSIGN TO 'inputfile.txt'
     ORGANIZATION IS LINE SEQUENTIAL.
    SELECT OUTPUT-FILE ASSIGN TO 'outputfile.txt'
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
    OPEN INPUT INPUT-FILE
    OPEN OUTPUT OUTPUT-FILE
    PERFORM UNTIL WS-LINE-COUNT > WS-MAX-LINES
     READ INPUT-FILE
         AT END
          DISPLAY "End of file reached."
          EXIT PERFORM
         NOT AT END
          MOVE INPUT-RECORD TO OUTPUT-RECORD
          WRITE OUTPUT-RECORD
          ADD 1 TO WS-LINE-COUNT
          IF WS-LINE-COUNT > WS-MAX-LINES
              PERFORM SPLIT-FILE
          END-IF
     END-READ
    END-PERFORM
    CLOSE INPUT-FILE
    CLOSE OUTPUT-FILE
    DISPLAY "File splitting completed."
    STOP RUN.

SPLIT-FILE.
    CLOSE OUTPUT-FILE
    ADD 1 TO WS-FILE-NUMBER
    MOVE 'outputfile' TO WS-FILE-NAME
    STRING WS-FILE-NUMBER DELIMITED BY SIZE INTO WS-FILE-NAME
    OPEN OUTPUT OUTPUT-FILE
    MOVE 0 TO WS-LINE-COUNT.

