IDENTIFICATION DIVISION.
PROGRAM-ID. WORDCOUNTER.
AUTHOR. YOUR-NAME-HERE.

* This program counts the number of words in a given input string.
* It reads the input string from the user, processes the string to
* count the words, and then displays the word count to the user.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  INPUT-STRING       PIC X(100).
01  WORD-COUNT         PIC 9(4) VALUE 0.
01  INDEX              PIC 9(4) VALUE 1.
01  CHAR               PIC X.
01  IN-WORD            PIC X VALUE 'N'.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a string: " WITH NO ADVANCING.
    ACCEPT INPUT-STRING.

    PERFORM VARYING INDEX FROM 1 BY 1 UNTIL INDEX > LENGTH OF INPUT-STRING
     MOVE INPUT-STRING (INDEX:1) TO CHAR
     IF CHAR = SPACE OR CHAR = LOW-VALUE OR CHAR = HIGH-VALUE
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

    DISPLAY "Word count: " WORD-COUNT.

    * Allocate memory for a string (simulated)
    CALL 'CBL_ALLOC_MEM' USING BY VALUE 100 BY REFERENCE INPUT-STRING.

    * End of program
    STOP RUN.

