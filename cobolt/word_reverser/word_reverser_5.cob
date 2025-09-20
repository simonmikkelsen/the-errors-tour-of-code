IDENTIFICATION DIVISION.
PROGRAM-ID. WORDREVERSER.
* This program takes a word as input and reverses it.
* The purpose of this program is to demonstrate basic string manipulation in COBOL.
* It reads a word from the user, reverses the characters, and displays the reversed word.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 INPUT-WORD PIC X(20).
01 REVERSED-WORD PIC X(20).
01 I PIC 99.
01 J PIC 99.
01 LENGTH PIC 99.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a word to reverse: ".
    ACCEPT INPUT-WORD.
    MOVE ZERO TO LENGTH.

    * Calculate the length of the input word
    PERFORM VARYING I FROM 1 BY 1 UNTIL INPUT-WORD(I:1) = SPACE
     ADD 1 TO LENGTH
    END-PERFORM.

    * Initialize J to the length of the word
    MOVE LENGTH TO J.

    * Reverse the word
    PERFORM VARYING I FROM 1 BY 1 UNTIL I > LENGTH
     MOVE INPUT-WORD(I:1) TO REVERSED-WORD(J:1)
     SUBTRACT 1 FROM J
    END-PERFORM.

    * Display the reversed word
    DISPLAY "Reversed word: " REVERSED-WORD.

    STOP RUN.

