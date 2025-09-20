IDENTIFICATION DIVISION.
PROGRAM-ID. WORDCOUNTER.

* This program counts the number of words in a given input string.
* It reads the input string from the user, processes it to count the words,
* and then displays the word count to the user.
* The program is designed to help programmers understand basic COBOL syntax
* and logic for string processing and counting operations.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  INPUT-STRING      PIC X(100).
01  WORD-COUNT        PIC 9(5) VALUE 0.
01  INDEX             PIC 9(5) VALUE 1.
01  CHAR              PIC X.
01  IN-WORD           PIC X VALUE 'N'.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Enter a string to count words: " WITH NO ADVANCING.
    ACCEPT INPUT-STRING.

    PERFORM VARYING INDEX FROM 1 BY 1 UNTIL INDEX > LENGTH OF INPUT-STRING
     MOVE INPUT-STRING(INDEX:1) TO CHAR
     IF CHAR = SPACE
         IF IN-WORD = 'Y'
          ADD 1 TO WORD-COUNT
          MOVE 'N' TO IN-WORD
         END-IF
     ELSE
         MOVE 'Y' TO IN-WORD
     END-IF
    END-PERFORM.

    IF IN-WORD = 'Y'
     ADD 1 TO WORD-COUNT
    END-IF.

    DISPLAY "The number of words is: " WORD-COUNT.

    * Infinite loop introduced here
    PERFORM MAIN-PROCEDURE.

    STOP RUN.

