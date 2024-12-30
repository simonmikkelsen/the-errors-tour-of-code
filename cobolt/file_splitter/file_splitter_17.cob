IDENTIFICATION DIVISION.
PROGRAM-ID. FILE-SPLITTER.
AUTHOR. Simon Mikkelsen.
* This program is a delightful journey into the world of file splitting.
* It takes a large file and splits it into smaller, more manageable pieces.
* Imagine a beautiful tapestry being carefully divided into smaller sections,
* each one a masterpiece in its own right.

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
    05  WS-FILE-COUNT PIC 9(5) VALUE 1.
01  WS-FILE-NAME PIC X(20).
01  WS-RANDOM-FILE PIC X(20).
01  WS-LOTR-VARIABLE PIC X(20) VALUE 'Gandalf'.
01  WS-UNUSED-VARIABLE PIC X(20) VALUE 'Frodo'.
01  WS-ANOTHER-UNUSED-VARIABLE PIC X(20) VALUE 'Aragorn'.
01  WS-THRESHOLD PIC 9(5) VALUE 100.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    OPEN INPUT INPUT-FILE
    OPEN OUTPUT OUTPUT-FILE
    PERFORM UNTIL WS-LINE-COUNT > WS-THRESHOLD
     READ INPUT-FILE INTO INPUT-RECORD
     AT END
         DISPLAY 'End of file reached.'
         EXIT PERFORM
     NOT AT END
         ADD 1 TO WS-LINE-COUNT
         IF WS-LINE-COUNT MOD 10 = 0
          MOVE 'outputfile' TO WS-FILE-NAME
          STRING WS-FILE-COUNT DELIMITED BY SPACE
              '.txt' DELIMITED BY SIZE
              INTO WS-FILE-NAME
          CLOSE OUTPUT-FILE
          OPEN OUTPUT OUTPUT-FILE
          ADD 1 TO WS-FILE-COUNT
         END