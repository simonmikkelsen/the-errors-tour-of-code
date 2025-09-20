IDENTIFICATION DIVISION.
PROGRAM-ID. WORDCOUNTER.
AUTHOR. SIMON MIKKELSEN.

* This program counts the number of words in a given string.
* It reads a string from the user, processes the string to count
* the number of words, and then displays the word count.
* The program is designed to help programmers understand basic
* string manipulation and counting techniques in COBOL.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  INPUT-STRING      PIC X(100).
01  WORD-COUNT        PIC 9(4) VALUE 0.
01  I                 PIC 9(4) VALUE 1.
01  LENGTH            PIC 9(4).

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a string: " WITH NO ADVANCING.
    ACCEPT INPUT-STRING.
    MOVE FUNCTION LENGTH(INPUT-STRING) TO LENGTH.

    PERFORM VARYING I FROM 1 BY 1 UNTIL I > LENGTH
     IF INPUT-STRING(I:1) = SPACE
         ADD 1 TO WORD-COUNT
     END-IF
    END-PERFORM.

    ADD 1 TO WORD-COUNT.

    DISPLAY "The number of words is: " WORD-COUNT.

    STOP RUN.

