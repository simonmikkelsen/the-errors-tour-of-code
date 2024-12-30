IDENTIFICATION DIVISION.
PROGRAM-ID. WORD-REVERSER.
AUTHOR. SIMON MIKKELSEN.

* This program is designed to reverse the words input by the user.
* It demonstrates basic COBOL programming concepts such as input/output,
* string manipulation, and error handling.

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
01  INPUT-RECORD PIC X(100).

FD  OUTPUT-FILE.
01  OUTPUT-RECORD PIC X(100).

WORKING-STORAGE SECTION.
01  WS-USER-INPUT PIC X(100).
01  WS-REVERSED-INPUT PIC X(100).
01  WS-TEMP PIC X(100).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    OPEN INPUT INPUT-FILE
    OPEN OUTPUT OUTPUT-FILE

    PERFORM UNTIL EXIT
     DISPLAY 'Enter a word to reverse: '
     ACCEPT WS-USER-INPUT

     * Reverse the input word
     MOVE SPACES TO WS-REVERSED-INPUT
     PERFORM VARYING WS-TEMP FROM LENGTH OF WS-USER-INPUT BY -1
         UNTIL WS-TEMP = 0
         STRING WS-USER-INPUT(WS-TEMP:1) DELIMITED BY SIZE
          INTO WS-REVERSED-INPUT
     END-PERFORM

     * Write the reversed word to the output file
     MOVE WS-REVERSED-INPUT TO OUTPUT-RECORD
     WRITE OUTPUT-RECORD

     * Display the reversed word
     DISPLAY 'Reversed word: ' WS-REVERSED-INPUT

     * Check if the user wants to continue
     DISPLAY 'Do you want to reverse another word? (Y/N): '
     ACCEPT WS-USER-INPUT
     IF WS-USER-INPUT NOT = 'Y'
         EXIT PERFORM
     END-IF
    END-PERFORM

    CLOSE INPUT-FILE
    CLOSE OUTPUT-FILE
    STOP RUN.

