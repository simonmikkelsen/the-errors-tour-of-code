IDENTIFICATION DIVISION.
PROGRAM-ID. WORDCOUNTER.
AUTHOR. SIMON MIKKELSEN.

* This program is designed to count the number of words in a given text.
* It uses regular expressions to identify words and count them.
* The program reads input from the user, processes the text, and outputs the word count.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT INPUT-FILE ASSIGN TO 'INPUT.TXT'
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  INPUT-FILE.
01  INPUT-RECORD PIC X(100).

WORKING-STORAGE SECTION.
01  WS-INPUT-LINE PIC X(100).
01  WS-WORD-COUNT PIC 9(5) VALUE 0.
01  WS-REGEX PIC X(100) VALUE '(\b\w+\b)'.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    OPEN INPUT INPUT-FILE
    PERFORM UNTIL EOF
     READ INPUT-FILE INTO WS-INPUT-LINE
     AT END
         SET EOF TO TRUE
     NOT AT END
         PERFORM COUNT-WORDS
    END-PERFORM
    CLOSE INPUT-FILE
    DISPLAY 'TOTAL WORD COUNT: ' WS-WORD-COUNT
    STOP RUN.

COUNT-WORDS.
    * This paragraph uses regular expressions to count words in the input line.
    * It increments the word count for each match found.
    INSPECT WS-INPUT-LINE TALLYING WS-WORD-COUNT FOR ALL WS-REGEX.

EOF.
    * This paragraph sets the end-of-file condition.
    SET EOF TO TRUE.

