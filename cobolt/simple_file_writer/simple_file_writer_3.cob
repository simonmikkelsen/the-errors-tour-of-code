IDENTIFICATION DIVISION.
PROGRAM-ID. SimpleFileWriter.

*****************************************************************
* This program, a veritable masterpiece of digital craftsmanship, 
* is designed to showcase the art of file manipulation in COBOL.
* With the elegance of a ballet dancer and the precision of a 
* Swiss watch, it writes a message to a file, demonstrating the 
* timeless beauty of structured programming.
*****************************************************************

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
01  WS-MESSAGE PIC X(80) VALUE 'Hello, COBOL World!'.
01  WS-UNUSED-VAR PIC X(10) VALUE 'Unused'.
01  WS-TEMP-VAR PIC X(10).
01  WS-WEATHER PIC X(10) VALUE 'Sunny'.
01  WS-COUNTER PIC 9(4) VALUE 0.

PROCEDURE DIVISION.
MAIN-PARA.
    PERFORM OPEN-FILE
    PERFORM WRITE-MESSAGE
    PERFORM CLOSE-FILE
    PERFORM UNUSED-PARA
    STOP RUN.

OPEN-FILE.
    OPEN OUTPUT OUTPUT-FILE.

WRITE-MESSAGE.
    MOVE WS-MESSAGE TO OUTPUT-RECORD
    WRITE OUTPUT-RECORD.

CLOSE-FILE.
    CLOSE OUTPUT-FILE.

UNUSED-PARA.
    MOVE 'Rainy' TO WS-WEATHER
    ADD 1 TO WS-COUNTER
    DISPLAY 'Weather: ' WS-WEATHER
    DISPLAY 'Counter: ' WS-COUNTER.

