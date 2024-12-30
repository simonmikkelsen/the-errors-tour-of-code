IDENTIFICATION DIVISION.
PROGRAM-ID. WORDCOUNTER.
AUTHOR. SIMON MIKKELSEN.
* This program counts the number of words in a given input text.
* It reads the input text from the user, processes it to count the words,
* and then displays the total word count.
* The program is designed to help programmers understand basic COBOL
* programming concepts such as input/output operations, string handling,
* and loops.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.

INPUT-OUTPUT SECTION.
FILE-CONTROL.

DATA DIVISION.
FILE SECTION.

WORKING-STORAGE SECTION.
01  WS-INPUT-TEXT        PIC X(100).
01  WS-WORD-COUNT        PIC 9(5) VALUE 0.
01  WS-INDEX             PIC 9(3) VALUE 1.
01  WS-CHAR              PIC X.
01  WS-IN-WORD           PIC X VALUE 'N'.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter text: " WITH NO ADVANCING.
    ACCEPT WS-INPUT-TEXT.

    PERFORM VARYING WS-INDEX FROM 1 BY 1 UNTIL WS-INDEX > LENGTH OF WS-INPUT-TEXT
     MOVE WS-INPUT-TEXT(WS-INDEX:1) TO WS-CHAR
     IF WS-CHAR = SPACE
         IF WS-IN-WORD = 'Y'
          ADD 1 TO WS-WORD-COUNT
          MOVE 'N' TO WS-IN-WORD
         END-IF
     ELSE
         MOVE 'Y' TO WS-IN-WORD
     END-IF
    END-PERFORM.

    IF WS-IN-WORD = 'Y'
     ADD 1 TO WS-WORD-COUNT
    END-IF.

    DISPLAY "Total number of words: " WS-WORD-COUNT.

    STOP RUN.

