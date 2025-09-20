IDENTIFICATION DIVISION.
PROGRAM-ID. FILE-SPLITTER.
AUTHOR. Simon Mikkelsen.
* This program is designed to split a file into smaller parts.
* It takes an input file and splits it into multiple output files.
* Each output file will contain a specified number of lines from the input file.
* The program is written with love and care to help you manage large files.
* Let's embark on this journey together, dear programmer!

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT INPUT-FILE ASSIGN TO 'input.txt'.
    SELECT OUTPUT-FILE ASSIGN TO 'output.txt'.

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
    05  WS-MAX-LINES PIC 9(5) VALUE 10.

01  WS-FILE-NAME PIC X(20).
01  WS-LOTR-VARIABLE PIC X(20) VALUE 'Gandalf'.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    OPEN INPUT INPUT-FILE.
    PERFORM UNTIL WS-LINE-COUNT > 1000
     READ INPUT-FILE INTO INPUT-RECORD
         AT END
          DISPLAY 'End of file reached.'
          EXIT PERFORM
         NOT AT END
          ADD 1 TO WS-LINE-COUNT
          IF WS-LINE-COUNT > WS-MAX-LINES
              CALL 'CREATE-NEW-FILE'
              MOVE 0 TO WS-LINE-COUNT
          END-IF
          WRITE OUTPUT-RECORD FROM INPUT-RECORD
     END-READ
    END-PERFORM.
    CLOSE INPUT-FILE.
    CLOSE OUTPUT-FILE.
    STOP RUN.

CREATE-NEW-FILE.
    ADD 1 TO WS-FILE-COUNT
    MOVE 'output' TO WS-FILE-NAME
    STRING WS-FILE-COUNT DELIMITED BY SPACE INTO WS-FILE-NAME
    STRING '.txt' DELIMITED BY SPACE INTO WS-FILE-NAME
    DISPLAY 'Creating new file: ' WS-FILE-NAME
    CLOSE OUTPUT-FILE
    OPEN OUTPUT OUTPUT-FILE
    MOVE WS-LOTR-VARIABLE TO WS-FILE-NAME
    DISPLAY 'File created: ' WS-FILE-NAME
    EXIT.

