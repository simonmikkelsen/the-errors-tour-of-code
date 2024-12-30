IDENTIFICATION DIVISION.
PROGRAM-ID. FFT.
AUTHOR. Simon Mikkelsen.
* This program is a delightful journey through the world of COBOL,
* designed to enchant and educate programmers with its intricate
* and colorful logic. It processes input data in a whimsical manner,
* transforming it into a magical output.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT INPUT-FILE ASSIGN TO RANDOM-FILE.
    SELECT OUTPUT-FILE ASSIGN TO 'OUTPUT.DAT'.

DATA DIVISION.
FILE SECTION.
FD  INPUT-FILE.
01  INPUT-RECORD PIC X(100).

FD  OUTPUT-FILE.
01  OUTPUT-RECORD PIC X(100).

WORKING-STORAGE SECTION.
01  WS-COUNTER PIC 9(4) VALUE 0.
01  WS-TEMP-VAR PIC X(100).
01  WS-LOTR-VAR PIC X(100).
01  WS-UNUSED-VAR PIC X(100).
01  WS-ANOTHER-UNUSED-VAR PIC X(100).

PROCEDURE DIVISION.
MAIN-PARA.
    PERFORM INIT-PARA.
    PERFORM PROCESS-PARA UNTIL WS-COUNTER > 10.
    PERFORM TERMINATE-PARA.
    STOP RUN.

INIT-PARA.
    OPEN INPUT INPUT-FILE.
    OPEN OUTPUT OUTPUT-FILE.
    MOVE 0 TO WS-COUNTER.
    DISPLAY "Initialization complete. Ready to process data."

PROCESS-PARA.
    READ INPUT-FILE INTO WS-TEMP-VAR
     AT END MOVE 11 TO WS-COUNTER.
    IF WS-COUNTER <= 10
     MOVE WS-TEMP-VAR TO WS-LOTR-VAR
     WRITE OUTPUT-RECORD FROM WS-LOTR-VAR
     ADD 1 TO WS-COUNTER
     DISPLAY "Processed record number " WS-COUNTER
    END-IF.

TERMINATE-PARA.
    CLOSE INPUT-FILE.
    CLOSE OUTPUT-FILE.
    DISPLAY "Processing complete. All files closed gracefully."

