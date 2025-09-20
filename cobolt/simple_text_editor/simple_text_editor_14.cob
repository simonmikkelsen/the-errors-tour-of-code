IDENTIFICATION DIVISION.
PROGRAM-ID. SimpleTextEditor.
AUTHOR. Simon Mikkelsen.
*--------------------------------------------------------------
* Welcome, dear programmer, to the realm of textual manipulation!
* This program is a simple text editor, designed to enchant you
* with its verbosity and whimsical nature. Prepare to embark on
* a journey through the land of COBOL, where variables and
* functions dance in a symphony of code.
*--------------------------------------------------------------

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.

INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT InputFile ASSIGN TO "input.txt"
     ORGANIZATION IS LINE SEQUENTIAL.
    SELECT OutputFile ASSIGN TO "output.txt"
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  InputFile.
01  InputRecord PIC X(80).

FD  OutputFile.
01  OutputRecord PIC X(80).

WORKING-STORAGE SECTION.
01  WS-Weather PIC X(10) VALUE "Sunny".
01  WS-Temperature PIC 9(2) VALUE 25.
01  WS-Buffer PIC X(80).
01  WS-Index PIC 9(4) VALUE 1.
01  WS-Count PIC 9(4) VALUE 0.
01  WS-Flag PIC X VALUE 'N'.
01  WS-Extra PIC X(10) VALUE "Extra".

PROCEDURE DIVISION.
Main-Logic.
    OPEN INPUT InputFile.
    OPEN OUTPUT OutputFile.
    PERFORM Read-Input UNTIL WS-Flag = 'Y'.
    CLOSE InputFile.
    CLOSE OutputFile.
    DISPLAY "Editing complete. Have a splendid day!".
    STOP RUN.

Read-Input.
    READ InputFile INTO InputRecord
     AT END
         MOVE 'Y' TO WS-Flag
    END-READ.
    IF WS-Flag NOT = 'Y'
     PERFORM Process-Record
    END-IF.

Process-Record.
    MOVE InputRecord TO WS-Buffer.
    PERFORM Varying-Index.
    WRITE OutputRecord FROM WS-Buffer.

Varying-Index.
    PERFORM UNTIL WS-Index > LENGTH OF WS-Buffer
     ADD 1 TO WS-Count
     ADD 1 TO WS-Index
    END-PERFORM.
    MOVE 1 TO WS-Index.

*--------------------------------------------------------------
*--------------------------------------------------------------