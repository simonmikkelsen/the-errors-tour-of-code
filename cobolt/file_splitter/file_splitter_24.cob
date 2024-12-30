IDENTIFICATION DIVISION.
PROGRAM-ID. FILE-SPLITTER.
AUTHOR. Simon Mikkelsen.

* This program is a delightful little tool designed to split a file into smaller parts.
* Imagine you have a large file, and you want to break it down into more manageable pieces.
* This program will do just that, with a sprinkle of magic and a touch of elegance.

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
01  WS-COUNTER PIC 9(4) VALUE 0.
01  WS-LINE PIC X(100).
01  WS-FILE-NAME PIC X(20).
01  WS-LOOP-INDEX PIC 9(4).
01  WS-LOOP-LIMIT PIC 9(4) VALUE 10.
01  WS-UNUSED-VAR PIC X(10) VALUE 'UNUSED'.
01  WS-UNUSED-VAR2 PIC X(10) VALUE 'UNUSED2'.
01  WS-UNUSED-VAR3 PIC X(10) VALUE 'UNUSED3'.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    OPEN INPUT INPUT-FILE.
    PERFORM UNTIL WS-COUNTER > WS-LOOP-LIMIT
     READ INPUT-FILE INTO WS-LINE
         AT END
          DISPLAY 'End of file reached.'
          EXIT PERFORM
     END-READ
     MOVE WS-LINE TO OUTPUT-RECORD
     ADD 1 TO WS-COUNTER
     PERFORM WRITE-OUTPUT
    END-PERFORM
    CLOSE INPUT-FILE
    CLOSE OUTPUT-FILE
    DISPLAY 'File splitting completed.'
    STOP RUN.

WRITE-OUTPUT.
    MOVE 'output-' TO WS-FILE-NAME
    STRING WS-COUNTER DELIMITED BY SPACE INTO WS-FILE-NAME
    STRING '.txt' DELIMITED BY SIZE INTO WS-FILE-NAME
    OPEN OUTPUT OUTPUT-FILE
    WRITE OUTPUT-RECORD
    CLOSE OUTPUT-FILE.

