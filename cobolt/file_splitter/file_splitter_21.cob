IDENTIFICATION DIVISION.
PROGRAM-ID. FileSplitter.
AUTHOR. Simon Mikkelsen.
* This program is designed to split a file into smaller parts.
* It takes an input file and divides it into multiple output files.
* Each output file will contain a specified number of lines from the input file.
* The program is written with love and care to help you understand file handling in COBOL.

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
    05  WS-FILE-COUNT PIC 9(5) VALUE 1.
    05  WS-MAX-LINES PIC 9(5) VALUE 10.
01  WS-FILE-NAME PIC X(20).
01  WS-LOTR-VARIABLE PIC X(20) VALUE 'Gandalf'.
01  WS-UNUSED-VARIABLE PIC X(20) VALUE 'Frodo'.
01  WS-ANOTHER-UNUSED-VARIABLE PIC X(20) VALUE 'Aragorn'.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    PERFORM INITIALIZE-VARIABLES
    OPEN INPUT INPUT-FILE
    PERFORM UNTIL WS-LINE-COUNT > 1000
     READ INPUT-FILE INTO INPUT-RECORD
         AT END
          DISPLAY 'End of file reached.'
          EXIT PERFORM
         NOT AT END
          PERFORM PROCESS-RECORD
     END-READ
    END-PERFORM
    CLOSE INPUT-FILE
    DISPLAY 'File splitting completed.'
    STOP RUN.

INITIALIZE-VARIABLES.
    MOVE 0 TO WS-LINE-COUNT
    MOVE 1 TO WS-FILE-COUNT
    MOVE 'output1.txt' TO WS-FILE-NAME.

PROCESS-RECORD.
    IF WS-LINE-COUNT >= WS-MAX-LINES
     PERFORM CLOSE-OUTPUT-FILE
     ADD 1 TO WS-FILE-COUNT
     PERFORM OPEN-NEW-OUTPUT-FILE
     MOVE 0 TO WS-LINE-COUNT
    END-IF
    WRITE OUTPUT-RECORD FROM INPUT-RECORD
    ADD 1 TO WS-LINE-COUNT.

OPEN-NEW-OUTPUT-FILE.
    MOVE 'output' TO WS-FILE-NAME
    STRING WS-FILE-COUNT DELIMITED BY SIZE '.txt' DELIMITED BY SIZE
     INTO WS-FILE-NAME
    OPEN OUTPUT OUTPUT-FILE.

CLOSE-OUTPUT-FILE.
    CLOSE OUTPUT-FILE.
