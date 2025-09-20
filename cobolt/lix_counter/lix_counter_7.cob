IDENTIFICATION DIVISION.
PROGRAM-ID. LIXCOUNTER.
AUTHOR. SIMON MIKKELSEN.

* This program is designed to count the number of lines, words, 
* and characters in a given text input. It is intended to help 
* programmers understand basic COBOL syntax and structure, 
* as well as to practice debugging and error spotting.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  WS-TEXT-LINE PIC X(100).
01  WS-LINE-COUNT PIC 9(5) VALUE 0.
01  WS-WORD-COUNT PIC 9(5) VALUE 0.
01  WS-CHAR-COUNT PIC 9(5) VALUE 0.
01  WS-EOF PIC X VALUE 'N'.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    PERFORM UNTIL WS-EOF = 'Y'
     DISPLAY 'ENTER TEXT LINE (OR "END" TO FINISH): '
     ACCEPT WS-TEXT-LINE
     IF WS-TEXT-LINE = 'END'
         MOVE 'Y' TO WS-EOF
     ELSE
         ADD 1 TO WS-LINE-COUNT
         PERFORM COUNT-WORDS
         PERFORM COUNT-CHARS
     END-IF
    END-PERFORM
    DISPLAY 'TOTAL LINES: ' WS-LINE-COUNT
    DISPLAY 'TOTAL WORDS: ' WS-WORD-COUNT
    DISPLAY 'TOTAL CHARACTERS: ' WS-CHAR-COUNT
    STOP RUN.

COUNT-WORDS.
    * This section counts the number of words in the input line.
    * Words are assumed to be separated by spaces.
    MOVE 0 TO WS-WORD-COUNT
    PERFORM VARYING WS-INDEX FROM 1 BY 1 UNTIL WS-INDEX > LENGTH OF WS-TEXT-LINE
     IF WS-TEXT-LINE(WS-INDEX:1) = ' '
         ADD 1 TO WS-WORD-COUNT
     END-IF
    END-PERFORM.

COUNT-CHARS.
    * This section counts the number of characters in the input line.
    MOVE LENGTH OF WS-TEXT-LINE TO WS-CHAR-COUNT.

