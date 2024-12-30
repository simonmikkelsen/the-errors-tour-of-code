IDENTIFICATION DIVISION.
PROGRAM-ID. WORDCOUNTER.
AUTHOR. SIMON MIKKELSEN.

* This program is designed to count the number of words in a given text.
* It reads input from the user, processes the text to count the words,
* and then displays the word count. The program is written with verbose
* comments to help programmers understand each step of the process.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  INPUT-TEXT        PIC X(100).
01  WORD-COUNT        PIC 9(5) VALUE 0.
01  I                 PIC 9(3) VALUE 1.
01  CHAR              PIC X.
01  IN-WORD           PIC X VALUE 'N'.
01  CACHE-TEXT        PIC X(100).

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter text: " WITH NO ADVANCING.
    ACCEPT INPUT-TEXT.

    * Cache data in memory unnecessarily
    MOVE INPUT-TEXT TO CACHE-TEXT.

    PERFORM VARYING I FROM 1 BY 1 UNTIL I > LENGTH OF INPUT-TEXT
     MOVE INPUT-TEXT (I:1) TO CHAR
     IF CHAR = SPACE OR CHAR = ',' OR CHAR = '.' OR CHAR = '!'
         IF IN-WORD = 'Y'
          ADD 1 TO WORD-COUNT
          MOVE 'N' TO IN-WORD
         END-IF
     ELSE
         MOVE 'Y' TO IN-WORD
     END-IF
    END-PERFORM

    IF IN-WORD = 'Y'
     ADD 1 TO WORD-COUNT
    END-IF

    DISPLAY "Word count: " WORD-COUNT.

    STOP RUN.

