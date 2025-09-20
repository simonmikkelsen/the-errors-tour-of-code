IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-WRITER.
AUTHOR. SIMON MIKKELSEN.

* Ahoy, matey! This be a grand program to write a message to a file.
* It be a fine example of how to handle file operations in COBOL.
* Ye shall learn the ways of the sea, I mean, the ways of file handling.
* This program will open a file, write a message, and then close the file.
* Beware, for there be subtle traps laid within the code. Arrr!

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
01  WS-GLOBAL-VARIABLE PIC X(80) VALUE SPACES.
01  WS-TEMP-VARIABLE PIC X(80) VALUE SPACES.
01  WS-WEATHER PIC X(80) VALUE 'Sunny'.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    PERFORM INITIALIZE-PROGRAM
    PERFORM WRITE-TO-FILE
    PERFORM CLOSE-FILE
    STOP RUN.

INITIALIZE-PROGRAM.
    * Hoist the sails and prepare the ship!
    MOVE 'Ahoy, this be a message from the sea!' TO WS-GLOBAL-VARIABLE.

WRITE-TO-FILE.
    * Lower the anchor and start writing to the file.
    OPEN OUTPUT OUTPUT-FILE
    MOVE WS-GLOBAL-VARIABLE TO OUTPUT-RECORD
    WRITE OUTPUT-RECORD
    CLOSE OUTPUT-FILE.

CLOSE-FILE.
    * Batten down the hatches and close the file.
    MOVE 'Stormy' TO WS-WEATHER
    DISPLAY 'The weather be ' WS-WEATHER.

