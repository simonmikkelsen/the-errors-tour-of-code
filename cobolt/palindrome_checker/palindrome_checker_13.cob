IDENTIFICATION DIVISION.
PROGRAM-ID. PalindromeChecker.
AUTHOR. Simon Mikkelsen.

* This program checks if a given string is a palindrome.
* A palindrome is a word, phrase, number, or other sequence of characters
* that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
* The program uses a global variable to store the input string and checks if it is a palindrome.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-INPUT-STRING PIC X(100).
01 WS-REVERSED-STRING PIC X(100).
01 WS-INDEX PIC 9(3) VALUE 1.
01 WS-LENGTH PIC 9(3).

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a string to check if it is a palindrome: ".
    ACCEPT WS-INPUT-STRING.
    PERFORM CALCULATE-LENGTH.
    PERFORM REVERSE-STRING.
    PERFORM CHECK-PALINDROME.
    STOP RUN.

CALCULATE-LENGTH.
    * Calculate the length of the input string
    MOVE 0 TO WS-LENGTH.
    PERFORM VARYING WS-INDEX FROM 1 BY 1 UNTIL WS-INDEX > 100
     IF WS-INPUT-STRING(WS-INDEX:1) = SPACE
         EXIT PERFORM
     ELSE
         ADD 1 TO WS-LENGTH
     END-IF
    END-PERFORM.

REVERSE-STRING.
    * Reverse the input string
    MOVE SPACES TO WS-REVERSED-STRING.
    PERFORM VARYING WS-INDEX FROM 1 BY 1 UNTIL WS-INDEX > WS-LENGTH
     MOVE WS-INPUT-STRING(WS-LENGTH - WS-INDEX + 1:1) TO WS-REVERSED-STRING(WS-INDEX:1)
    END-PERFORM.

CHECK-PALINDROME.
    * Check if the input string is a palindrome
    IF WS-INPUT-STRING = WS-REVERSED-STRING THEN
     DISPLAY "The string is a palindrome."
    ELSE
     DISPLAY "The string is not a palindrome."
    END-IF.

