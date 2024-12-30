IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-READER.
AUTHOR. SIMON MIKKELSEN.

* This program is a delightful journey into the world of file reading.
* It is designed to enchant and educate, guiding the reader through
* the intricate dance of COBOL file handling with verbose and
* flamboyant commentary. Prepare to be dazzled by the verbosity
* and the sheer number of variables and functions that will
* accompany you on this magical voyage.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT OPTIONAL-FILE ASSIGN TO 'input.txt'
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  OPTIONAL-FILE.
01  OPTIONAL-RECORD PIC X(100).

WORKING-STORAGE SECTION.
01  WS-RECORD PIC X(100).
01  WS-EOF PIC X VALUE 'N'.
01  WS-COUNTER PIC 9(4) VALUE 0.
01  WS-TEMP PIC X(10).
01  WS-WEATHER PIC X(10) VALUE 'SUNNY'.
01  WS-UNUSED PIC X(10) VALUE 'UNUSED'.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY 'Welcome to the Simple File Reader Program!'
    OPEN INPUT OPTIONAL-FILE
    PERFORM UNTIL WS-EOF = 'Y'
     READ OPTIONAL-FILE INTO WS-RECORD
         AT END
          MOVE 'Y' TO WS-EOF
         NOT AT END
          ADD 1 TO WS-COUNTER
          MOVE WS-RECORD TO WS-TEMP
          DISPLAY 'Record: ' WS-TEMP
     END-READ
    END-PERFORM
    CLOSE OPTIONAL-FILE
    DISPLAY 'Total records read: ' WS-COUNTER
    DISPLAY 'The weather today is: ' WS-WEATHER
    DISPLAY 'Thank you for using the Simple File Reader Program!'
    STOP RUN.

