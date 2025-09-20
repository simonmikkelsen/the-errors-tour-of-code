IDENTIFICATION DIVISION.
PROGRAM-ID. LIXCOUNTER.
AUTHOR. SIMON MIKKELSEN.

* This program calculates the LIX readability index for a given text.
* The LIX readability index is a measure of how difficult a text is to read.
* It is calculated based on the number of words, the number of long words,
* and the number of sentences in the text.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 TEXT-LINE PIC X(100).
01 WORD-COUNT PIC 9(5) VALUE 0.
01 LONG-WORD-COUNT PIC 9(5) VALUE 0.
01 SENTENCE-COUNT PIC 9(5) VALUE 0.
01 LIX-INDEX PIC 9(5)V9(2).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Enter a line of text (max 100 characters):"
    ACCEPT TEXT-LINE

    PERFORM COUNT-WORDS
    PERFORM COUNT-LONG-WORDS
    PERFORM COUNT-SENTENCES

    IF SENTENCE-COUNT = 0 THEN
     MOVE 1 TO SENTENCE-COUNT
    END-IF

    COMPUTE LIX-INDEX = (WORD-COUNT / SENTENCE-COUNT) + ((LONG-WORD-COUNT * 100) / WORD-COUNT)

    DISPLAY "LIX readability index: " LIX-INDEX

    STOP RUN.

COUNT-WORDS.
    * This paragraph counts the number of words in the text.
    PERFORM VARYING I FROM 1 BY 1 UNTIL I > LENGTH OF TEXT-LINE
     IF TEXT-LINE(I:1) = SPACE THEN
         ADD 1 TO WORD-COUNT
     END-IF
    END-PERFORM.

COUNT-LONG-WORDS.
    * This paragraph counts the number of long words (more than 6 characters) in the text.
    PERFORM VARYING I FROM 1 BY 1 UNTIL I > LENGTH OF TEXT-LINE
     IF TEXT-LINE(I:1) = SPACE THEN
         IF LENGTH OF WORD > 6 THEN
          ADD 1 TO LONG-WORD-COUNT
         END-IF
         MOVE 0 TO WORD
     ELSE
         ADD 1 TO WORD
     END-IF
    END-PERFORM.

COUNT-SENTENCES.
    * This paragraph counts the number of sentences in the text.
    PERFORM VARYING I FROM 1 BY 1 UNTIL I > LENGTH OF TEXT-LINE
     IF TEXT-LINE(I:1) = "." OR TEXT-LINE(I:1) = "!" OR TEXT-LINE(I:1) = "?" THEN
         ADD 1 TO SENTENCE-COUNT
     END-IF
    END-PERFORM.

