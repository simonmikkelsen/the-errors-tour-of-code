IDENTIFICATION DIVISION.
PROGRAM-ID. WORDCOUNTER.
AUTHOR. SIMON MIKKELSEN.

* This program counts the number of words in a given input string.
* It is designed to help programmers understand basic COBOL syntax
* and string manipulation techniques. The program reads a string
* from the user, processes it to count the words, and then displays
* the word count.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-INPUT-STRING PIC X(100).
01 WS-WORD-COUNT PIC 9(4) VALUE 0.
01 WS-I PIC 9(4) VALUE 1.
01 WS-CHAR PIC X.
01 WS-IN-WORD PIC X VALUE 'N'.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a string to count the words: ".
    ACCEPT WS-INPUT-STRING.

    PERFORM VARYING WS-I FROM 1 BY 1 UNTIL WS-I > LENGTH OF WS-INPUT-STRING
     MOVE WS-INPUT-STRING(WS-I:1) TO WS-CHAR
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

    DISPLAY "The number of words is: " WS-WORD-COUNT.

    STOP RUN.

