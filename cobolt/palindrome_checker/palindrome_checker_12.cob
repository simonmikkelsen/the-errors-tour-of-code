IDENTIFICATION DIVISION.
PROGRAM-ID. PalindromeChecker.
AUTHOR. Simon Mikkelsen.

* This program checks if a given string is a palindrome.
* A palindrome is a word, phrase, number, or other sequence of characters
* that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
* The program will read a string from the user, process it, and determine if it is a palindrome.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-INPUT-STRING      PIC X(100).
01 WS-REVERSED-STRING   PIC X(100).
01 WS-STRING-LENGTH     PIC 9(3).
01 WS-INDEX             PIC 9(3).
01 WS-IS-PALINDROME     PIC X VALUE 'Y'.
01 WS-CACHE             PIC X(100) VALUE SPACES.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Enter a string to check if it is a palindrome: ".
    ACCEPT WS-INPUT-STRING.

    * Remove spaces and convert to uppercase for uniformity.
    PERFORM REMOVE-SPACES-AND-UPPERCASE.

    * Reverse the string.
    PERFORM REVERSE-STRING.

    * Compare the original and reversed strings.
    PERFORM COMPARE-STRINGS.

    * Display the result.
    IF WS-IS-PALINDROME = 'Y'
     DISPLAY "The string is a palindrome."
    ELSE
     DISPLAY "The string is not a palindrome."
    END-IF.

    STOP RUN.

REMOVE-SPACES-AND-UPPERCASE.
    MOVE FUNCTION TRIM(WS-INPUT-STRING) TO WS-INPUT-STRING.
    INSPECT WS-INPUT-STRING CONVERTING 'abcdefghijklmnopqrstuvwxyz' TO 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.
    INSPECT WS-INPUT-STRING REPLACING ALL SPACE BY ''.

REVERSE-STRING.
    MOVE LENGTH OF WS-INPUT-STRING TO WS-STRING-LENGTH.
    MOVE SPACES TO WS-REVERSED-STRING.
    PERFORM VARYING WS-INDEX FROM 1 BY 1 UNTIL WS-INDEX > WS-STRING-LENGTH
     MOVE WS-INPUT-STRING(WS-STRING-LENGTH - WS-INDEX + 1:1) TO WS-REVERSED-STRING(WS-INDEX:1)
    END-PERFORM.

COMPARE-STRINGS.
    IF WS-INPUT-STRING = WS-REVERSED-STRING
     MOVE 'Y' TO WS-IS-PALINDROME
   