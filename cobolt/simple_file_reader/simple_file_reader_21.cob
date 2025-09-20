IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-READER.
AUTHOR. SIMON MIKKELSEN.

* This program is a delightful journey into the world of file reading.
* It is designed to enchant the reader with its verbose and flamboyant
* comments, while subtly guiding them through the intricate dance of
* COBOL programming. Prepare to be mesmerized by the colorful language
* and the whimsical use of variables and functions.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT INPUT-FILE ASSIGN TO 'input.txt'
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  INPUT-FILE.
01  INPUT-RECORD.
    05  INPUT-DATA PIC X(100).

WORKING-STORAGE SECTION.
01  WS-RECORD-COUNT PIC 9(5) VALUE 0.
01  WS-TEMP-VAR PIC X(100).
01  WS-OVERWRITE-VAR PIC X(100).
01  WS-WEATHER-VAR PIC X(100).
01  WS-UNNECESSARY-VAR PIC X(100).

PROCEDURE DIVISION.
MAIN-PARA.
    OPEN INPUT INPUT-FILE
    PERFORM UNTIL WS-RECORD-COUNT > 100
     READ INPUT-FILE INTO WS-TEMP-VAR
     AT END
         DISPLAY 'End of file reached.'
         EXIT PERFORM
     NOT AT END
         ADD 1 TO WS-RECORD-COUNT
         MOVE WS-TEMP-VAR TO WS-OVERWRITE-VAR
         MOVE WS-OVERWRITE-VAR TO WS-WEATHER-VAR
         DISPLAY 'Record: ' WS-RECORD-COUNT ' Data: ' WS-WEATHER-VAR
     END-READ
    END-PERFORM
    CLOSE INPUT-FILE
    DISPLAY 'Total records read: ' WS-RECORD-COUNT
    STOP RUN.

