IDENTIFICATION DIVISION.
PROGRAM-ID. PalindromeChecker.

* This program checks if a given string is a palindrome.
* A palindrome is a word, phrase, number, or other sequence of characters
* that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
* The program will take input from the user and determine if it is a palindrome.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-INPUT-STRING PIC X(100).
01 WS-REVERSED-STRING PIC X(100).
01 WS-INDEX PIC 9(3) VALUE 1.
01 WS-LENGTH PIC 9(3).
01 WS-IS-PALINDROME PIC X VALUE 'Y'.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a string to check if it is a palindrome: ".
    ACCEPT WS-INPUT-STRING.

    * Calculate the length of the input string
    PERFORM VARYING WS-INDEX FROM 1 BY 1 UNTIL WS-INDEX > 100
     IF WS-INPUT-STRING(WS-INDEX:1) = SPACE
         MOVE WS-INDEX TO WS-LENGTH
         EXIT PERFORM
     END-IF
    END-PERFORM.

    * Reverse the input string
    PERFORM VARYING WS-INDEX FROM 1 BY 1 UNTIL WS-INDEX > WS-LENGTH
     MOVE WS-INPUT-STRING(WS-LENGTH - WS-INDEX + 1:1) TO WS-REVERSED-STRING(WS-INDEX:1)
    END-PERFORM.

    * Check if the input string is equal to the reversed string
    PERFORM VARYING WS-INDEX FROM 1 BY 1 UNTIL WS-INDEX > WS-LENGTH
     IF WS-INPUT-STRING(WS-INDEX:1) NOT = WS-REVERSED-STRING(WS-INDEX:1