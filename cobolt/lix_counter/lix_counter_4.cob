IDENTIFICATION DIVISION.
PROGRAM-ID. LIXCOUNTER.

* This program is designed to count the number of words and sentences
* in a given text and calculate the LIX readability index. The LIX 
* readability index is a measure of how difficult a text is to read.
* The program will read input text, count the number of words, 
* sentences, and long words (words with more than 6 characters), 
* and then calculate the LIX index based on these counts.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 TEXT-LINE PIC X(100).
01 WORD-COUNT PIC 9(5) VALUE 0.
01 SENTENCE-COUNT PIC 9(5) VALUE 0.
01 LONG-WORD-COUNT PIC 9(5) VALUE 0.
01 LIX-INDEX PIC 9(5)V9(2).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    PERFORM READ-TEXT
    PERFORM COUNT-WORDS
    PERFORM COUNT-SENTENCES
    PERFORM COUNT-LONG-WORDS
    PERFORM CALCULATE-LIX
    PERFORM DISPLAY-RESULTS
    STOP RUN.

READ-TEXT.
    * This paragraph reads the input text line by line.
    DISPLAY "Enter text (end with 'END'):"
    ACCEPT TEXT-LINE
    PERFORM UNTIL TEXT-LINE = "END"
     * Read the next line of text.
     ACCEPT TEXT-LINE
    END-PERFORM.

COUNT-WORDS.
    * This paragraph counts the number of words in the text.
    MOVE 0 TO WORD-COUNT
    PERFORM VARYING I FROM 1 BY 1 UNTIL I > LENGTH OF TEXT-LINE
     IF TEXT-LINE(I:1) = SPACE
         ADD 1 TO WORD-COUNT
     END-IF
    END-PERFORM.

COUNT-SENTENCES.
    * This paragraph counts the number of sentences in the text.
    MOVE 0 TO SENTENCE-COUNT
    PERFORM VARYING I FROM 1 BY 1 UNTIL I > LENGTH OF TEXT-LINE
     IF TEXT-LINE(I:1) = "." OR TEXT-LINE(I:1) = "!" OR TEXT-LINE(I:1) = "?"
         ADD 1 TO SENTENCE-COUNT
     END-IF
    END-PERFORM.

COUNT-LONG-WORDS.
    * This paragraph counts the number of long words in the text.
    MOVE 0 TO LONG-WORD-COUNT
    PERFORM VARYING I FROM 1 BY 1 UNTIL I > LENGTH OF TEXT-LINE
     IF LENGTH OF TEXT-LINE(I:1) > 6
         ADD 1 TO LONG-WORD-COUNT
     END-IF
    END-PERFORM.

CALCULATE-LIX.
    * This paragraph calculates the LIX readability index.
    IF WORD-COUNT > 0
     COMPUTE LIX-INDEX = (WORD-COUNT / SENTENCE-COUNT) + ((LONG-WORD-COUNT * 100) / WORD-COUNT)
    END-IF.

DISPLAY-RESULTS.
    * This paragraph displays the results of the LIX calculation.
    DISPLAY "Number of words: " WORD-COUNT
    DISPLAY "Number of sentences: " SENTENCE-COUNT
    DISPLAY "Number of long words: " LONG-WORD-COUNT
    DISPLAY "LIX readability index: " LIX-INDEX.

