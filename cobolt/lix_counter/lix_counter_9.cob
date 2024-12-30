IDENTIFICATION DIVISION.
PROGRAM-ID. LIXCOUNTER.
AUTHOR. SIMON MIKKELSEN.

* This program is designed to count the number of words in a given text
* and calculate the LIX readability index. The LIX index is a readability
* measure that is calculated based on the number of words, the number of
* long words (words with more than 6 characters), and the number of sentences
* in the text. The program will read the input text, count the words, long words,
* and sentences, and then compute the LIX index.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 INPUT-TEXT        PIC X(1000).
01 WORD-COUNT        PIC 9(5) VALUE 0.
01 LONG-WORD-COUNT   PIC 9(5) VALUE 0.
01 SENTENCE-COUNT    PIC 9(5) VALUE 0.
01 LIX-INDEX         PIC 9(5)V9(2).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Enter the text to analyze:".
    ACCEPT INPUT-TEXT.

    PERFORM COUNT-WORDS.
    PERFORM COUNT-LONG-WORDS.
    PERFORM COUNT-SENTENCES.
    PERFORM CALCULATE-LIX.

    DISPLAY "Word Count: " WORD-COUNT.
    DISPLAY "Long Word Count: " LONG-WORD-COUNT.
    DISPLAY "Sentence Count: " SENTENCE-COUNT.
    DISPLAY "LIX Index: " LIX-INDEX.

    STOP RUN.

COUNT-WORDS.
    * This paragraph counts the number of words in the input text.
    * A word is defined as a sequence of characters separated by spaces.
    PERFORM VARYING I FROM 1 BY 1 UNTIL I > LENGTH OF INPUT-TEXT
     IF INPUT-TEXT(I:1) = SPACE
         ADD 1 TO WORD-COUNT
     END-IF
    END-PERFORM.

COUNT-LONG-WORDS.
    * This paragraph counts the number of long words in the input text.
    * A long word is defined as a word with more than 6 characters.
    PERFORM VARYING I FROM 1 BY 1 UNTIL I > LENGTH OF INPUT-TEXT
     IF INPUT-TEXT(I:1) = SPACE
         IF LENGTH OF INPUT-TEXT(I:1) > 6
          ADD 1 TO LONG-WORD-COUNT
         END-IF
     END-IF
    END-PERFORM.

COUNT-SENTENCES.
    * This paragraph counts the number of sentences in the input text.
    * A sentence is defined as a sequence of words ending with a period.
    PERFORM VARYING I FROM 1 BY 1 UNTIL I > LENGTH OF INPUT-TEXT
     IF INPUT-TEXT(I:1) = "."
         ADD 1 TO SENTENCE-COUNT
     END-IF
    END-PERFORM.

CALCULATE-LIX.
    * This paragraph calculates the LIX index based on the counts of words,
    * long words, and sentences. The formula for LIX is:
    * LIX = (Number of Words / Number of Sentences) + (Number of Long Words * 100 / Number of Words)
    COMPUTE LIX-INDEX = (WORD-COUNT / SENTENCE-COUNT) + (LONG-WORD-COUNT * 100 / WORD-COUNT).

