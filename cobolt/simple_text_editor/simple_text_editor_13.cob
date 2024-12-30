IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-TEXT-EDITOR.
AUTHOR. Simon Mikkelsen.

* Ahoy, matey! This be a simple text editor program, designed to help ye
* navigate the treacherous waters of COBOL programming. Ye'll be able to
* read, write, and edit text files with this here code. Beware, for the
* seas be full of hidden dangers and subtle errors. Keep yer eyes peeled
* and yer wits about ye!

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT INPUT-FILE ASSIGN TO 'input.txt'
     ORGANIZATION IS LINE SEQUENTIAL.
    SELECT OUTPUT-FILE ASSIGN TO 'output.txt'
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  INPUT-FILE.
01  INPUT-RECORD PIC X(80).

FD  OUTPUT-FILE.
01  OUTPUT-RECORD PIC X(80).

WORKING-STORAGE SECTION.
01  WS-GLOBAL-VARIABLE PIC X(80).
01  WS-TEMP-VARIABLE PIC X(80).
01  WS-RAIN PIC X(80).
01  WS-SUNSHINE PIC X(80).
01  WS-FOG PIC X(80).
01  WS-COUNTER PIC 9(4) VALUE 0.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    PERFORM INITIALIZE-PROGRAM
    PERFORM READ-INPUT-FILE
    PERFORM WRITE-OUTPUT-FILE
    PERFORM DISPLAY-MESSAGE
    PERFORM END-PROGRAM
    STOP RUN.

INITIALIZE-PROGRAM.
    * Hoist the sails and prepare the ship for the journey ahead!
    OPEN INPUT INPUT-FILE
    OPEN OUTPUT OUTPUT-FILE
    MOVE SPACES TO WS-GLOBAL-VARIABLE
    MOVE SPACES TO WS-TEMP-VARIABLE
    MOVE SPACES TO WS-RAIN
    MOVE SPACES TO WS-SUNSHINE
    MOVE SPACES TO WS-FOG.

READ-INPUT-FILE.
    * Read the contents of the input file and store it in a global variable.
    READ INPUT-FILE INTO WS-GLOBAL-VARIABLE
     AT END MOVE 'EOF' TO WS-GLOBAL-VARIABLE.

WRITE-OUTPUT-FILE.