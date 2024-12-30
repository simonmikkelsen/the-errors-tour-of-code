IDENTIFICATION DIVISION.
PROGRAM-ID. PalindromeChecker.
AUTHOR. Simon Mikkelsen.

* This program checks if a given string is a palindrome.
* A palindrome is a string that reads the same forward and backward.
* The program takes user input and checks if it is a palindrome.
* It demonstrates basic string manipulation and comparison in COBOL.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-INPUT-STRING PIC X(100).
01 WS-REVERSED-STRING PIC X(100).
01 WS-LENGTH PIC 9(4) COMP.
01 WS-INDEX PIC 9(4) COMP.
01 WS-IS-PALINDROME PIC X VALUE 'Y'.

PROCEDURE DIVISION.
MAIN-LOGIC.
    DISPLAY "Enter a string to check if it is a palindrome: ".
    ACCEPT WS-INPUT-STRING.

    * Calculate the length of the input string.
    INSPECT WS-INPUT-STRING TALLYING WS-LENGTH FOR CHARACTERS BEFORE INITIAL SPACE.

    * Reverse the input string.
    MOVE SPACES TO WS-REVERSED-STRING.
    PERFORM VARYING WS-INDEX FROM 1 BY 1 UNTIL WS-INDEX > WS-LENGTH
     MOVE WS-INPUT-STRING(WS-LENGTH - WS-INDEX + 1:1) TO WS-REVERSED-STRING(WS-INDEX:1)
    END-PERFORM.

    * Compare the input string with the reversed string.
    PERFORM VARYING WS-INDEX FROM 1 BY 1 UNTIL WS-INDEX > WS-LENGTH
     IF WS-INPUT-STRING(WS-INDEX:1) NOT = WS-REVERSED-STRING(WS-INDEX:1)
         MOVE 'N' TO WS-IS-PALINDROME