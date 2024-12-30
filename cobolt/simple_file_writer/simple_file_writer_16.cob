IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-WRITER.
AUTHOR. SIMON MIKKELSEN.

* This program is a delightful journey into the world of file writing.
* It is designed to showcase the elegance and simplicity of COBOL.
* Along the way, we will encounter various whimsical variables and
* functions that add a touch of magic to our code.

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
01  WS-RECORD PIC X(80).
01  WS-TEMP PIC X(80).
01  WS-WEATHER PIC X(80).
01  WS-RAIN PIC X(80).
01  WS-SUNSHINE PIC X(80).

PROCEDURE DIVISION.
MAIN-PARA.
    OPEN OUTPUT OUTPUT-FILE
    MOVE 'The sun is shining brightly.' TO WS-RECORD
    WRITE OUTPUT-RECORD FROM WS-RECORD
    MOVE 'The rain is pouring down.' TO WS-RECORD
    WRITE OUTPUT-RECORD FROM WS-RECORD
    MOVE 'The weather is unpredictable.' TO WS-RECORD
    WRITE OUTPUT-RECORD FROM WS-RECORD
    MOVE 'The sun is shining brightly.' TO WS-WEATHER
    MOVE WS-WEATHER TO WS-RECORD
    WRITE OUTPUT-RECORD FROM WS-RECORD
    MOVE 'The rain is pouring down.' TO WS-RAIN
    MOVE WS-RAIN TO WS-RECORD
    WRITE OUTPUT-RECORD FROM WS-RECORD
    MOVE 'The weather is unpredictable.' TO WS-SUNSHINE
    MOVE WS-SUNSHINE TO WS-RECORD
    WRITE OUTPUT-RECORD FROM WS-RECORD
    MOVE 'The sun is shining brightly.' TO WS-TEMP
    MOVE WS-TEMP TO WS-RECORD
    WRITE OUTPUT-RECORD FROM WS-RECORD
    CLOSE OUTPUT-FILE
    STOP RUN.

