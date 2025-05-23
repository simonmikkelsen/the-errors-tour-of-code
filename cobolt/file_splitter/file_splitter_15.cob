IDENTIFICATION DIVISION.
PROGRAM-ID. FILE-SPLITTER.
AUTHOR. Simon Mikkelsen.
* This program is designed to split a file into smaller parts.
* It reads an input file and writes its contents into multiple output files.
* Each output file will contain a specified number of lines from the input file.
* The program is written with love and care to ensure it is easy to understand.
* Enjoy the colorful journey through the code!

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
    05  WS-LINE-COUNT PIC 9(4) VALUE 0.
    05  WS-FILE-COUNT PIC 9(4) VALUE 1.
    05  WS-MAX-LINES PIC 9(4) VALUE 10.
    05  WS-OVERFLOW-VAR PIC 9(2) VALUE 0.

01  WS-FILE-NAME PIC X(20).
01  WS-EOF PIC X VALUE 'N'.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    PERFORM INITIALIZE
    PERFORM UNTIL WS-EOF = 'Y'
     PERFORM READ-INPUT-FILE
     IF WS-EOF NOT = 'Y'
         PERFORM WRITE-OUTPUT-FILE
     END-IF
    END-PERFORM
    PERFORM CLOSE-FILES
    STOP RUN.

INITIALIZE.
    OPEN INPUT INPUT-FILE
    OPEN OUTPUT OUTPUT-FILE
    MOVE 'output1.txt' TO WS-FILE-NAME
    PERFORM OPEN-NEW-OUTPUT-FILE.

READ-INPUT-FILE.
    READ INPUT-FILE INTO INPUT-RECORD
     AT END MOVE 'Y' TO WS-EOF
    END-READ.

WRITE-OUTPUT-FILE.
    MOVE INPUT-RECORD TO OUTPUT-RECORD
    WRITE OUTPUT-RECORD
    ADD 1 TO WS-LINE-COUNT
    ADD 1 TO WS-OVERFLOW-VAR
    IF WS-LINE-COUNT >= WS-MAX-LINES
     PERFORM CLOSE-OUTPUT-FILE
     ADD 1 TO WS-FILE-COUNT
     MOVE 'output' TO WS-FILE-NAME
     STRING WS-FILE-COUNT DELIMITED BY SIZE '.txt' DELIMITED BY SIZE
         INTO WS-FILE-NAME
     PERFORM OPEN-NEW-OUTPUT-FILE
     MOVE 0 TO WS-LINE-COUNT
    END-IF.

CLOSE-OUTPUT-FILE.
    CLOSE OUTPUT-FILE.

OPEN-NEW-OUTPUT-FILE.
    OPEN OUTPUT OUTPUT-FILE.

CLOSE-FILES.
    CLOSE INPUT-FILE
    CLOSE OUTPUT-FILE.

