IDENTIFICATION DIVISION.
PROGRAM-ID. LIXCOUNTER.
AUTHOR. SIMON MIKKELSEN.

* This program counts the number of words in a given text and calculates the LIX readability index.
* The LIX readability index is a measure of how difficult a text is to read.
* The formula for LIX is: (Number of words / Number of sentences) + (Number of long words * 100 / Number of words)
* A long word is defined as a word with more than 6 characters.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 TEXT-LINE PIC X(100) VALUE SPACES.
01 WORD-COUNT PIC 9(5) VALUE 0.
01 SENTENCE-COUNT PIC 9(5) VALUE 0.
01 LONG-WORD-COUNT PIC 9(5) VALUE 0.
01 LIX-INDEX PIC 9(5)V9(2) VALUE 0.00.
01 I PIC 9(3) VALUE 1.
01 CHAR PIC X VALUE SPACE.
01 WORD PIC X(20) VALUE SPACES.
01 WORD-LENGTH PIC 9(2) VALUE 0.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a line of text (max 100 characters): ".
    ACCEPT TEXT-LINE.

    PERFORM VARYING I FROM 1 BY 1 UNTIL I > LENGTH OF TEXT-LINE
     MOVE TEXT-LINE(I:1) TO CHAR
     IF CHAR = SPACE OR CHAR = '.' OR CHAR = '!' OR CHAR = '?'
         IF WORD-LENGTH > 0
          ADD 1 TO WORD-COUNT
          IF WORD-LENGTH > 6
              ADD 1 TO LONG-WORD-COUNT
          END-IF
          MOVE SPACES TO WORD
          MOVE 0 TO WORD-LENGTH
         END-IF
         IF CHAR = '.' OR CHAR = '!' OR CHAR = '?'
          ADD 1 TO SENTENCE-COUNT
         END-IF
     ELSE
         STRING CHAR DELIMITED BY SIZE INTO WORD
         ADD 1 TO WORD-LENGTH
     END-IF
    END-PERFORM.

    IF SENTENCE-COUNT = 0
     MOVE 1 TO SENTENCE-COUNT
    END-IF

    COMPUTE LIX-INDEX = (WORD-COUNT / SENTENCE-COUNT) + (LONG-WORD-COUNT * 100 / WORD-COUNT)

    DISPLAY "Number of words: " WORD-COUNT
    DISPLAY "Number of sentences: " SENTENCE-COUNT
    DISPLAY "Number of long words: " LONG-WORD-COUNT
    DISPLAY "LIX readability index: " LIX-INDEX

    STOP RUN.

