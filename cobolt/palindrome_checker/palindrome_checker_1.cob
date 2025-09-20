IDENTIFICATION DIVISION.
PROGRAM-ID. PalindromeChecker.
AUTHOR. Simon Mikkelsen.

* This program checks if a given string is a palindrome.
* A palindrome is a word, phrase, number, or other sequence of characters
* that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
* The program will take an input string from the user, process it to remove
* non-alphanumeric characters and convert it to lowercase, and then check
* if the processed string is a palindrome.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-INPUT-STRING PIC X(100).
01 WS-PROCESSED-STRING PIC X(100).
01 WS-REVERSED-STRING PIC X(100).
01 WS-INDEX PIC 9(3) VALUE 1.
01 WS-LENGTH PIC 9(3).

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a string to check if it is a palindrome: "
    ACCEPT WS-INPUT-STRING

    * Remove non-alphanumeric characters and convert to lowercase
    PERFORM VARYING WS-INDEX FROM 1 BY 1 UNTIL WS-INDEX > LENGTH OF WS-INPUT-STRING
     IF WS-INPUT-STRING(WS-INDEX:1) IS ALPHANUMERIC
         MOVE FUNCTION LOWER-CASE(WS-INPUT-STRING(WS-INDEX:1)) TO WS-PROCESSED-STRING(WS-INDEX:1)
     END-IF
    END-PERFORM

    * Calculate the length of the processed string
    COMPUTE WS-LENGTH = FUNCTION LENGTH(WS-PROCESSED-STRING)

    * Reverse the processed string
    PERFORM VARYING WS-INDEX FROM 1 BY 1 UNTIL WS-INDEX > WS-LENGTH
     MOVE WS-PROCESSED-STRING(WS-LENGTH - WS-INDEX + 1:1) TO WS-REVERSED-STRING(WS-INDEX:1)
    END-PERFORM

    * Check if the processed string is equal to the reversed string
    IF WS-PROCESSED-STRING = WS-REVERSED-STRING
     DISPLAY "The string is a palindrome."
    ELSE
     DISPLAY "The string is not a palindrome."
    END-IF

    STOP RUN.

