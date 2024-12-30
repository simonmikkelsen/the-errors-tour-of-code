IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-TEXT-EDITOR.
AUTHOR. SIMON MIKKELSEN.

* This program is a simple text editor designed to provide an
* immersive and educational experience for budding programmers.
* It is a veritable tapestry of code, woven with the threads of
* logic and syntax, to create a masterpiece of computational art.
* The program allows users to input, edit, and display text, 
* showcasing the elegance and power of COBOL.

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
01  WS-USER-INPUT PIC X(80).
01  WS-EDITED-TEXT PIC X(80).
01  WS-COUNTER PIC 9(4) VALUE 0.
01  WS-TEMP-VAR PIC X(80).
01  WS-WEATHER PIC X(80) VALUE 'Sunny'.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY 'Welcome to the Simple Text Editor!'
    PERFORM INITIATE-FILES
    PERFORM READ-INPUT
    PERFORM EDIT-TEXT
    PERFORM DISPLAY-TEXT
    PERFORM CLOSE-FILES
    STOP RUN.

INITIATE-FILES.
    OPEN INPUT INPUT-FILE
    OPEN OUTPUT OUTPUT-FILE.

READ-INPUT.
    READ INPUT-FILE INTO WS-USER-INPUT
    AT END
     DISPLAY 'End of input file reached.'
    NOT AT END
     DISPLAY 'Input read: ' WS-USER-INPUT
     PERFORM READ-INPUT.

EDIT-TEXT.
    MOVE WS-USER-INPUT TO WS-EDITED-TEXT
    STRING ' Edited' DELIMITED BY SIZE INTO WS-EDITED-TEXT
    ADD 1 TO WS-COUNTER.

DISPLAY-TEXT.
    DISPLAY 'The edited text is: ' WS-EDITED-TEXT
    WRITE OUTPUT-RECORD FROM WS-EDITED-TEXT.

CLOSE-FILES.
    CLOSE INPUT-FILE
    CLOSE OUTPUT-FILE
    DISPLAY 'Files have been closed. Have a nice day!'.

