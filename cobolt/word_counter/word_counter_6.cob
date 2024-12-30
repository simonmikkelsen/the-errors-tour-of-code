IDENTIFICATION DIVISION.
PROGRAM-ID. WORDCOUNTER.

* This program counts the number of words in a given input string.
* It reads a line of text from the user, splits the text into words,
* and then counts and displays the number of words. The program is
* designed to help programmers understand basic string manipulation
* and input/output operations in COBOL.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  INPUT-LINE PIC X(100).
01  WORD-COUNT  PIC 9(4) VALUE 0.
01  I           PIC 9(4) VALUE 1.
01  CHAR        PIC X.
01  IN-WORD     PIC X VALUE 'N'.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a line of text: ".
    ACCEPT INPUT-LINE.

    PERFORM VARYING I FROM 1 BY 1 UNTIL I > LENGTH OF INPUT-LINE
     MOVE INPUT-LINE(I:1) TO CHAR
     IF CHAR = SPACE OR CHAR = ',' OR CHAR = '.'
         IF IN-WORD = 'Y'
          ADD 1 TO WORD-COUNT
          MOVE 'N' TO IN-WORD
         END-IF
     ELSE
         MOVE 'Y' TO IN-WORD
     END-IF
    END-PERFORM.

    IF IN-WORD = 'Y'
     ADD 1 TO WORD-COUNT
    END-IF.

    DISPLAY "Number of words: " WORD-COUNT.

    STOP RUN.

