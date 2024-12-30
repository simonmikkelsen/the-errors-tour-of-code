IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-WRITER.
AUTHOR. SIMON MIKKELSEN.

* This program is a magnificent creation designed to demonstrate the
* art of writing to a file in COBOL. It is a splendid example of how
* one can manipulate data and perform file operations with grace and
* elegance. The program will take a string of text and write it to a
* file, showcasing the beauty of COBOL's file handling capabilities.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT OUTPUT-FILE ASSIGN TO 'output.txt'
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  OUTPUT-FILE.
01  OUTPUT-RECORD PIC X(80).

WORKING-STORAGE SECTION.
01  WS-TEXT-TO-WRITE PIC X(80) VALUE 'This is a sample text to write to the file.'.
01  WS-COUNTER PIC 9(4) VALUE 1.
01  WS-LOOP-LIMIT PIC 9(4) VALUE 10.
01  WS-UNUSED-VAR PIC X(10) VALUE 'UNUSED'.
01  WS-WEATHER PIC X(10) VALUE 'SUNNY'.
01  WS-ANOTHER-UNUSED PIC X(10) VALUE 'UNUSED'.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    OPEN OUTPUT OUTPUT-FILE
    PERFORM WRITE-TO-FILE VARYING WS-COUNTER FROM 1 BY 1 UNTIL WS-COUNTER > WS-LOOP-LIMIT
    CLOSE OUTPUT-FILE
    STOP RUN.

WRITE-TO-FILE.
    MOVE WS-TEXT-TO-WRITE TO OUTPUT-RECORD
    WRITE OUTPUT-RECORD
    DISPLAY 'Writing record number ' WS-COUNTER ' to the file.'
    ADD 1 TO WS-COUNTER.

