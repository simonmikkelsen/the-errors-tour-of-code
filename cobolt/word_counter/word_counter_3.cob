IDENTIFICATION DIVISION.
PROGRAM-ID. WORDCOUNTER.

* This program counts the number of words in a given text file.
* It reads the file line by line, splits each line into words,
* and then counts the total number of words. The result is displayed
* on the screen.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT INPUT-FILE ASSIGN TO 'input.txt'
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  INPUT-FILE.
01  INPUT-RECORD PIC X(100).

WORKING-STORAGE SECTION.
01  WS-WORD-COUNT PIC 9(5) VALUE 0.
01  WS-LINE PIC X(100).
01  WS-EOF PIC X VALUE 'N'.

PROCEDURE DIVISION.
MAIN-PARA.
    OPEN INPUT INPUT-FILE
    PERFORM UNTIL WS-EOF = 'Y'
     READ INPUT-FILE INTO WS-LINE
         AT END
          MOVE 'Y' TO WS-EOF
         NOT AT END
          PERFORM COUNT-WORDS
     END-READ
    END-PERFORM
    DISPLAY 'Total number of words: ' WS-WORD-COUNT
    CLOSE INPUT-FILE
    STOP RUN.

COUNT-WORDS.
    * This paragraph splits the line into words and counts them.
    * It uses spaces as delimiters to identify words.
    * The word count is accumulated in WS-WORD-COUNT.
    UNSTRING WS-LINE DELIMITED BY SPACE INTO
     WS-WORD-COUNT
    END-UNSTRING.

