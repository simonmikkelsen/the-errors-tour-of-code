IDENTIFICATION DIVISION.
PROGRAM-ID. PALINDROME-CHECKER.
AUTHOR. SIMON MIKKELSEN.

* This program checks if a given string is a palindrome.
* A palindrome is a word, phrase, number, or other sequence of characters
* that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
* The program reads input from a file, processes the string, and outputs the result.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT INPUT-FILE ASSIGN TO 'input.txt'
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  INPUT-FILE.
01  INPUT-RECORD.
    05  INPUT-LINE PIC X(100).

WORKING-STORAGE SECTION.
01  WS-EOF            PIC X VALUE 'N'.
    88  END-OF-FILE   VALUE 'Y'.
01  WS-INPUT-LINE     PIC X(100).
01  WS-REVERSED-LINE  PIC X(100).
01  WS-RESULT         PIC X(20).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    OPEN INPUT INPUT-FILE
    PERFORM UNTIL END-OF-FILE
     READ INPUT-FILE INTO INPUT-RECORD
         AT END
          SET END-OF-FILE TO TRUE
         NOT AT END
          MOVE INPUT-LINE TO WS-INPUT-LINE
          PERFORM CHECK-PALINDROME
          DISPLAY WS-RESULT
     END-READ
    END-PERFORM
    CLOSE INPUT-FILE
    STOP RUN.

CHECK-PALINDROME.
    MOVE SPACES TO WS-REVERSED-LINE
    PERFORM VARYING IDX FROM LENGTH OF WS-INPUT-LINE BY -1 UNTIL IDX < 1
     STRING WS-INPUT-LINE(IDX:1) DELIMITED BY SIZE INTO WS-REVERSED-LINE
    END-PERFORM
    IF WS-INPUT-LINE = WS-REVERSED-LINE
     MOVE 'Palindrome' TO WS-RESULT
    ELSE
     MOVE 'Not a palindrome' TO WS-RESULT
    END-IF.

