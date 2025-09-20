IDENTIFICATION DIVISION.
PROGRAM-ID. LIXCOUNTER.
AUTHOR. SIMON MIKKELSEN.

* This program is designed to count the number of words, sentences,
* and letters in a given text and calculate the LIX readability index.
* The LIX readability index is a measure of how difficult a text is to read.
* It is calculated using the formula:
* LIX = (Number of Words / Number of Sentences) + (Number of Long Words * 100 / Number of Words)
* where a long word is defined as a word with more than 6 letters.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 TEXT-INPUT        PIC X(1000).
01 WORD-COUNT        PIC 9(5) VALUE 0.
01 SENTENCE-COUNT    PIC 9(5) VALUE 0.
01 LETTER-COUNT      PIC 9(5) VALUE 0.
01 LONG-WORD-COUNT   PIC 9(5) VALUE 0.
01 LIX-INDEX         PIC 9(5)V9(2).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Enter the text to analyze:".
    ACCEPT TEXT-INPUT.

    PERFORM COUNT-WORDS.
    PERFORM COUNT-SENTENCES.
    PERFORM COUNT-LETTERS.
    PERFORM COUNT-LONG-WORDS.
    PERFORM CALCULATE-LIX.

    DISPLAY "Number of Words: " WORD-COUNT.
    DISPLAY "Number of Sentences: " SENTENCE-COUNT.
    DISPLAY "Number of Letters: " LETTER-COUNT.
    DISPLAY "Number of Long Words: " LONG-WORD-COUNT.
    DISPLAY "LIX Readability Index: " LIX-INDEX.

    STOP RUN.

COUNT-WORDS.
    * This paragraph counts the number of words in the input text.
    * A word is defined as a sequence of characters separated by spaces.
    PERFORM VARYING I FROM 1 BY 1 UNTIL I > LENGTH OF TEXT-INPUT
     IF TEXT-INPUT(I:1) = SPACE
         ADD 1 TO WORD-COUNT
     END-IF
    END-PERFORM.

COUNT-SENTENCES.
    * This paragraph counts the number of sentences in the input text.
    * A sentence is defined as a sequence of words ending with a period, exclamation mark, or question mark.
    PERFORM VARYING I FROM 1 BY 1 UNTIL I > LENGTH OF TEXT-INPUT
     IF TEXT-INPUT(I:1) = '.' OR TEXT-INPUT(I:1) = '!' OR TEXT-INPUT(I:1) = '?'
         ADD 1 TO SENTENCE-COUNT
     END-IF
    END-PERFORM.

COUNT-LETTERS.
    * This paragraph counts the number of letters in the input text.
    * A letter is defined as any alphabetic character.
    PERFORM VARYING I FROM 1 BY 1 UNTIL I > LENGTH OF TEXT-INPUT
     IF TEXT-INPUT(I:1) >= 'A' AND TEXT-INPUT(I:1) <= 'Z' OR
        TEXT-INPUT(I:1) >= 'a' AND TEXT-INPUT(I:1) <= 'z'
         ADD 1 TO LETTER-COUNT
     END-IF
    END-PERFORM.

COUNT-LONG-WORDS.
    * This paragraph counts the number of long words in the input text.
    * A long word is defined as a word with more than 6 letters.
    PERFORM VARYING I FROM 1 BY 1 UNTIL I > LENGTH OF TEXT-INPUT
     IF TEXT-INPUT(I:1) >= 'A' AND TEXT-INPUT(I:1) <= 'Z' OR
        TEXT-INPUT(I:1) >= 'a' AND TEXT-INPUT(I:1) <= 'z'
         ADD 1 TO LETTER-COUNT
         IF LETTER-COUNT > 6
          ADD 1 TO LONG-WORD-COUNT
         END-IF
     ELSE
         MOVE 0 TO LETTER-COUNT
     END-IF
    END-PERFORM.

CALCULATE-LIX.
    * This paragraph calculates the LIX readability index.
    * The formula for LIX is:
    * LIX = (Number of Words / Number of Sentences) + (Number of Long Words * 100 / Number of Words)
    COMPUTE LIX-INDEX = (WORD-COUNT / SENTENCE-COUNT) + (LONG-WORD-COUNT * 100 / WORD-COUNT).

