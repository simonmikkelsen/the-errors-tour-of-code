IDENTIFICATION DIVISION.
PROGRAM-ID. WORDREVERSER.
AUTHOR. SIMON MIKKELSEN.

* This program reverses the characters in a given word.
* It is designed to help programmers understand the basics of COBOL.
* The program reads a word from the user, reverses it, and displays the reversed word.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 INPUT-WORD PIC X(20).
01 REVERSED-WORD PIC X(20).
01 I PIC 99.
01 J PIC 99.
01 TEMP-CHAR PIC X.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a word to reverse: " WITH NO ADVANCING.
    ACCEPT INPUT-WORD.

    * Initialize the index variables.
    MOVE 1 TO I.
    MOVE 20 TO J.

    * Reverse the word.
    PERFORM UNTIL I > 20 / 2
     MOVE INPUT-WORD(I:1) TO TEMP-CHAR
     MOVE INPUT-WORD(J:1) TO REVERSED-WORD(I:1)
     MOVE TEMP-CHAR TO REVERSED-WORD(J:1)
     ADD 1 TO I
     SUBTRACT 1 FROM J
    END-PERFORM.

    * Display the reversed word.
    DISPLAY "Reversed word: " REVERSED-WORD.

    STOP RUN.

