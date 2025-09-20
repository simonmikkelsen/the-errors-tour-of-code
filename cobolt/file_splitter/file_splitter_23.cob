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
    SELECT INPUT-FILE ASSIGN TO 'LARGEFILE.TXT'
     ORGANIZATION IS LINE SEQUENTIAL.
    SELECT OUTPUT-FILE ASSIGN TO 'SMALLFILE.TXT'
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
01  WS-LOTR-VARIABLE PIC X(20) VALUE 'GANDALF'.
01  WS-UNUSED-VARIABLE PIC X(20) VALUE 'FRODO'.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    OPEN INPUT INPUT-FILE
    OPEN OUTPUT OUTPUT-FILE
    PERFORM UNTIL WS-LINE-COUNT > 1000
     READ INPUT-FILE INTO INPUT-RECORD
         AT END
          DISPLAY 'End of file reached.'
          EXIT PERFORM
         NOT AT END
          ADD 1 TO WS-LINE-COUNT
          WRITE OUTPUT-RECORD FROM INPUT-RECORD
          IF WS-LINE-COUNT = 100
              PERFORM SPLIT-FILE
          END-IF
     END-READ
    END-PERFORM
    CLOSE INPUT-FILE
    CLOSE OUTPUT-FILE
    DISPLAY 'File splitting complete.'
    STOP RUN.

SPLIT-FILE.
    MOVE 'SMALLFILE' TO WS-FILE-NAME
    STRING WS-FILE-COUNT DELIMITED BY SIZE INTO WS-FILE-NAME
    ADD 1 TO WS-FILE-COUNT
    MOVE 0 TO WS-LINE-COUNT
    OPEN OUTPUT OUTPUT-FILE
    * The file has been split, and a new file is created.
    * Like the chapters of a book, each file tells a part of the story.
    * The journey continues with each new file, a new adventure awaits.

