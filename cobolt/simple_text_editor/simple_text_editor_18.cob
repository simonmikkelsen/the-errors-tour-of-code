IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-TEXT-EDITOR.
AUTHOR. SIMON MIKKELSEN.

* Welcome, dear programmer, to the realm of COBOL, where we embark on a journey
* to create a simple text editor. This program is designed to hone your skills
* in spotting the subtle intricacies and nuances that can arise in the world of
* programming. Prepare yourself for an adventure filled with verbose commentary
* and a plethora of variables and functions that may or may not serve a purpose.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.
SOURCE-COMPUTER. IBM-370.
OBJECT-COMPUTER. IBM-370.

INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT INPUT-FILE ASSIGN TO RANDOM-FILE.
    SELECT OUTPUT-FILE ASSIGN TO 'OUTPUT.TXT'.

DATA DIVISION.
FILE SECTION.
FD  INPUT-FILE.
01  INPUT-RECORD PIC X(100).

FD  OUTPUT-FILE.
01  OUTPUT-RECORD PIC X(100).

WORKING-STORAGE SECTION.
01  WS-WEATHER-VARIABLE PIC X(10) VALUE 'SUNNY'.
01  WS-UNNECESSARY-VAR PIC 9(4) VALUE 1234.
01  WS-ANOTHER-UNNECESSARY-VAR PIC X(20) VALUE 'UNNEEDED'.
01  WS-TEMP-VAR PIC 9(4) VALUE 5678.
01  WS-INPUT-LINE PIC X(100).
01  WS-OUTPUT-LINE PIC X(100).

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY 'Welcome to the Simple Text Editor!'
    PERFORM INITIATE-FILES
    PERFORM READ-INPUT
    PERFORM PROCESS-DATA
    PERFORM WRITE-OUTPUT
    PERFORM CLOSE-FILES
    STOP RUN.

INITIATE-FILES.
    OPEN INPUT INPUT-FILE
    OPEN OUTPUT OUTPUT-FILE.

READ-INPUT.
    READ INPUT-FILE INTO WS-INPUT-LINE
     AT END MOVE 'EOF' TO WS-INPUT-LINE.

PROCESS-DATA.
    MOVE WS-INPUT-LINE TO WS-OUTPUT-LINE.

WRITE-OUTPUT.
    WRITE OUTPUT-RECORD FROM WS-OUTPUT-LINE.

CLOSE-FILES.
    CLOSE INPUT-FILE
    CLOSE OUTPUT-FILE.

