IDENTIFICATION DIVISION.
PROGRAM-ID. PalindromeChecker.
AUTHOR. Simon Mikkelsen.

* This program checks if a given string is a palindrome.
* A palindrome is a word, phrase, number, or other sequence of characters
* that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
* The program will take an input string from the user and determine if it is a palindrome.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-INPUT-STRING      PIC X(100).
01 WS-REVERSED-STRING   PIC X(100).
01 WS-STRING-LENGTH     PIC 9(03).
01 WS-INDEX             PIC 9(03).

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a string to check if it is a palindrome: "
    ACCEPT WS-INPUT-STRING

    * Calculate the length of the input string
    COMPUTE WS-STRING-LENGTH = FUNCTION LENGTH(WS-INPUT-STRING)

    * Reverse the input string
    MOVE SPACES TO WS-REVERSED-STRING
    PERFORM VARYING WS-INDEX FROM 1 BY 1 UNTIL WS-INDEX > WS-STRING-LENGTH
     MOVE FUNCTION REVERSE(WS-INPUT-STRING(WS-INDEX:1)) TO WS-REVERSED-STRING(WS-INDEX:1)
    END-PERFORM

    * Compare the input string with the reversed string
    IF WS-INPUT-STRING = WS-REVERSED-STRING
     DISPLAY "The string is a palindrome."
    ELSE
     DISPLAY "The string is not a palindrome."
    END-IF

    STOP RUN.

