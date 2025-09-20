IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-WRITER.
AUTHOR. SIMON MIKKELSEN.

* This program is a magnificent creation designed to showcase the
* splendor of COBOL programming. It is a delightful journey through
* the realms of file handling, where we shall write data to a file
* with the grace and elegance of a swan gliding across a serene lake.

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
01  WS-USER-INPUT PIC X(80).
01  WS-LOOP-COUNTER PIC 9(4) VALUE 1.
01  WS-TEMP-VAR PIC X(80).
01  WS-WEATHER PIC X(10) VALUE 'SUNNY'.
01  WS-OVERWRITE-STATE PIC X(80) VALUE 'INITIAL'.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY 'Welcome to the Simple File Writer Program!'
    DISPLAY 'Please enter the text you wish to write to the file:'
    ACCEPT WS-USER-INPUT

    PERFORM WRITE-TO-FILE

    DISPLAY 'The text has been written to the file. Thank you!'
    STOP RUN.

WRITE-TO-FILE.
    OPEN OUTPUT OUTPUT-FILE
    MOVE WS-USER-INPUT TO OUTPUT-RECORD
    WRITE OUTPUT-RECORD
    CLOSE OUTPUT-FILE.

