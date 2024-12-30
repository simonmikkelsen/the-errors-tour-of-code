IDENTIFICATION DIVISION.
PROGRAM-ID. WORDCOUNTER.

* This program counts the number of words in a given input string.
* It reads a string from the user, processes it to count the words,
* and then displays the total word count. The program is designed
* to help programmers understand basic string manipulation and
* counting logic in COBOL.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  INPUT-STRING       PIC X(100).
01  WORD-COUNT         PIC 9(4) VALUE 0.
01  INDEX              PIC 9(4) VALUE 1.
01  LENGTH             PIC 9(4).
01  CHAR               PIC X.
01  IN-WORD            PIC X VALUE 'N'.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Enter a string: " WITH NO ADVANCING.
    ACCEPT INPUT-STRING.

    MOVE FUNCTION LENGTH(INPUT-STRING) TO LENGTH.

    PERFORM VARYING INDEX FROM 1 BY 1 UNTIL INDEX > LENGTH
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

    DISPLAY "Total number of words: " WORD-COUNT.

    STOP RUN.

