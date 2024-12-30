IDENTIFICATION DIVISION.
PROGRAM-ID. WORDCOUNTER.

* This program counts the number of words in a given input string.
* It reads the input string from the user, processes it to count
* the words, and then displays the word count to the user.
* The program demonstrates basic string manipulation and control
* flow in COBOL.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.

DATA DIVISION.
FILE SECTION.

WORKING-STORAGE SECTION.
01  WS-INPUT-STRING      PIC X(100).
01  WS-WORD-COUNT        PIC 9(5).
01  WS-INDEX             PIC 9(3).
01  WS-CHAR              PIC X.
01  WS-IN-WORD           PIC X VALUE 'N'.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a string: " WITH NO ADVANCING.
    ACCEPT WS-INPUT-STRING.

    MOVE 0 TO WS-WORD-COUNT.
    MOVE 1 TO WS-INDEX.

    PERFORM VARYING WS-INDEX FROM 1 BY 1 UNTIL WS-INDEX > LENGTH OF WS-INPUT-STRING
     MOVE WS-INPUT-STRING(WS-INDEX:1) TO WS-CHAR
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

    DISPLAY "Word count: " WS-WORD-COUNT.

    STOP RUN.

