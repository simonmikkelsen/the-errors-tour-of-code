IDENTIFICATION DIVISION.
PROGRAM-ID. WORDREVERSER.
AUTHOR. SIMON MIKKELSEN.

* This program is designed to reverse the characters in a given word.
* It takes a word as input and outputs the reversed word.
* The program demonstrates basic string manipulation in COBOL.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 INPUT-WORD PIC X(20).
01 REVERSED-WORD PIC X(20).
01 I PIC 99.
01 J PIC 99.
01 WORD-LENGTH PIC 99.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a word to reverse: " WITH NO ADVANCING.
    ACCEPT INPUT-WORD.

    MOVE ZERO TO WORD-LENGTH.
    PERFORM VARYING I FROM 1 BY 1 UNTIL I > 20
     IF INPUT-WORD(I:1) NOT = SPACE
         ADD 1 TO WORD-LENGTH
     ELSE
         EXIT PERFORM
     END-IF
    END-PERFORM.

    MOVE ZERO TO J.
    PERFORM VARYING I FROM WORD-LENGTH BY -1 UNTIL I = 0
     ADD 1 TO J
     MOVE INPUT-WORD(I:1) TO REVERSED-WORD(J:1)
    END-PERFORM.

    DISPLAY "Reversed word: " REVERSED-WORD.

    * This is where the error is subtly introduced
    MOVE SPACES TO INPUT-WORD.

    STOP RUN.

