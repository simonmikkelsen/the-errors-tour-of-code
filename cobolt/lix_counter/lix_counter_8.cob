IDENTIFICATION DIVISION.
PROGRAM-ID. LIXCOUNTER.
AUTHOR. SIMON MIKKELSEN.

* This program calculates the LIX readability index for a given text.
* The LIX index is a readability measure that is calculated using the
* number of words, the number of long words (more than 6 characters),
* and the number of sentences in the text.
* The purpose of this program is to help programmers understand how to
* implement basic text processing and readability calculations in COBOL.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 TEXT-LINE PIC X(100).
01 WORD-COUNT PIC 9(5).
01 LONG-WORD-COUNT PIC 9(5).
01 SENTENCE-COUNT PIC 9(5).
01 LIX-INDEX PIC 9(5)V9(2).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Enter a line of text (max 100 characters):".
    ACCEPT TEXT-LINE.

    PERFORM COUNT-WORDS.
    PERFORM COUNT-LONG-WORDS.
    PERFORM COUNT-SENTENCES.
    PERFORM CALCULATE-LIX.

    DISPLAY "LIX Index: " LIX-INDEX.

    STOP RUN.

COUNT-WORDS.
    * This section counts the number of words in the input text.
    MOVE 0 TO WORD-COUNT.
    PERFORM VARYING I FROM 1 BY 1 UNTIL I > LENGTH OF TEXT-LINE
     IF TEXT-LINE(I:1) = SPACE
         ADD 1 TO WORD-COUNT
     END-IF
    END-PERFORM.

COUNT-LONG-WORDS.
    * This section counts the number of long words (more than 6 characters)
    * in the input text.
    MOVE 0 TO LONG-WORD-COUNT.
    PERFORM VARYING I FROM 1 BY 1 UNTIL I > LENGTH OF TEXT-LINE
     IF TEXT-LINE(I:1) = SPACE
         IF LENGTH OF WORD > 6
          ADD 1 TO LONG-WORD-COUNT
         END-IF
     END-IF
    END-PERFORM.

COUNT-SENTENCES.
    * This section counts the number of sentences in the input text.
    MOVE 0 TO SENTENCE-COUNT.
    PERFORM VARYING I FROM 1 BY 1 UNTIL I > LENGTH OF TEXT-LINE
     IF TEXT-LINE(I:1) = "." OR TEXT-LINE(I:1) = "!" OR TEXT-LINE(I:1) = "?"
         ADD 1 TO SENTENCE-COUNT
     END-IF
    END-PERFORM.

CALCULATE-LIX.
    * This section calculates the LIX index using the formula:
    * LIX = (Number of Words / Number of Sentences) + (Number of Long Words * 100 / Number of Words)
    COMPUTE LIX-INDEX = (WORD-COUNT / SENTENCE-COUNT) + (LONG-WORD-COUNT * 100 / WORD-COUNT).

