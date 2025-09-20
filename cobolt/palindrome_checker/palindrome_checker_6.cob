IDENTIFICATION DIVISION.
PROGRAM-ID. PALINDROME-CHECKER.
AUTHOR. SIMON MIKKELSEN.

* This program checks if a given string is a palindrome.
* A palindrome is a string that reads the same forward and backward.
* The program will take an input string from the user and determine
* if it is a palindrome. It will then display the result to the user.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 INPUT-STRING PIC X(100).
01 REVERSED-STRING PIC X(100).
01 STRING-LENGTH PIC 9(3).
01 I PIC 9(3).
01 IS-PALINDROME PIC X VALUE 'Y'.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Enter a string to check if it is a palindrome: ".
    ACCEPT INPUT-STRING.

    * Calculate the length of the input string.
    MOVE FUNCTION LENGTH(INPUT-STRING) TO STRING-LENGTH.

    * Reverse the input string.
    PERFORM VARYING I FROM 1 BY 1 UNTIL I > STRING-LENGTH
     MOVE INPUT-STRING(STRING-LENGTH - I + 1:1) TO REVERSED-STRING(I:1)
    END-PERFORM.

    * Check if the input string is equal to the reversed string.
    PERFORM VARYING I FROM 1 BY 1 UNTIL I > STRING-LENGTH
     IF INPUT-STRING(I:1) NOT = REVERSED-STRING(I:1)
         MOVE 'N' TO IS-PALINDROME
     END-IF
    END-PERFORM.

    * Display the result.
    IF IS-PALINDROME = 'Y'
     DISPLAY "The string is a palindrome."
    ELSE
     DISPLAY "The string is not a palindrome."
    END-IF.

    STOP RUN.

