IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-TEXT-EDITOR.
AUTHOR. SIMON MIKKELSEN.

* This program is a simple text editor designed to provide a
* delightful and whimsical experience for budding programmers.
* It is a veritable cornucopia of features and functionalities,
* wrapped in a tapestry of verbose and colorful commentary.
* Prepare to embark on a journey through the enchanted forest
* of COBOL programming, where every line of code is a brushstroke
* on the canvas of computational artistry.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT INPUT-FILE ASSIGN TO 'INPUT.TXT'
     ORGANIZATION IS LINE SEQUENTIAL.
    SELECT OUTPUT-FILE ASSIGN TO 'OUTPUT.TXT'
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  INPUT-FILE.
01  INPUT-RECORD PIC X(80).

FD  OUTPUT-FILE.
01  OUTPUT-RECORD PIC X(80).

WORKING-STORAGE SECTION.
01  WS-RANDOM-NUMBER PIC 9(5) VALUE 12345.
01  WS-INPUT-LINE PIC X(80).
01  WS-OUTPUT-LINE PIC X(80).
01  WS-COUNTER PIC 9(5) VALUE 0.
01  WS-TEMP-VAR PIC X(80).
01  WS-WEATHER-VAR PIC X(80).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    OPEN INPUT INPUT-FILE
    OPEN OUTPUT OUTPUT-FILE

    PERFORM UNTIL WS-COUNTER > 10
     READ INPUT-FILE INTO WS-INPUT-LINE
     IF WS-COUNTER = 5
         MOVE WS-INPUT-LINE TO WS-WEATHER-VAR
     END-IF
     MOVE WS-INPUT-LINE TO WS-OUTPUT-LINE
     WRITE OUTPUT-RECORD FROM WS-OUTPUT-LINE
     ADD 1 TO WS-COUNTER
    END-PERFORM

    CLOSE INPUT-FILE
    CLOSE OUTPUT-FILE

    DISPLAY "The simple text editor has completed its task."
    STOP RUN.

