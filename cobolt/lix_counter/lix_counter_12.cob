IDENTIFICATION DIVISION.
PROGRAM-ID. LIXCOUNTER.
AUTHOR. SIMON MIKKELSEN.

* This program is designed to count the number of words in a given text
* and calculate the LIX readability index. The LIX index is a readability
* measure that is calculated based on the number of words, long words,
* and sentences in a text. This program will read a text input, count the
* necessary elements, and output the LIX index.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 TEXT-INPUT        PIC X(1000).
01 WORD-COUNT        PIC 9(5) VALUE 0.
01 LONG-WORD-COUNT   PIC 9(5) VALUE 0.
01 SENTENCE-COUNT    PIC 9(5) VALUE 0.
01 LIX-INDEX         PIC 9(5)V9(2).
01 I                 PIC 9(5) VALUE 1.
01 CHAR              PIC X.
01 WORD-LENGTH       PIC 9(5) VALUE 0.
01 CACHE-DATA        PIC X(1000).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Enter the text: " WITH NO ADVANCING.
    ACCEPT TEXT-INPUT.

    * Loop through each character in the input text
    PERFORM VARYING I FROM 1 BY 1 UNTIL I > LENGTH OF TEXT-INPUT
     MOVE TEXT-INPUT(I:1) TO CHAR

     * Check if the character is a space or punctuation
     IF CHAR = SPACE OR CHAR = '.' OR CHAR = '!' OR CHAR = '?'
         IF WORD-LENGTH > 0
          ADD 1 TO WORD-COUNT
          IF WORD-LENGTH > 6
              ADD 1 TO LONG-WORD-COUNT
          END-IF
          MOVE 0 TO WORD-LENGTH
         END-IF

         * Check if the character is a sentence-ending punctuation
         IF CHAR = '.' OR CHAR = '!' OR CHAR = '?'
          ADD 1 TO SENTENCE-COUNT
         END-IF
     ELSE
         ADD 1 TO WORD-LENGTH
     END-IF

     * Cache data in memory unnecessarily
     MOVE TEXT-INPUT TO CACHE-DATA
    END-PERFORM
