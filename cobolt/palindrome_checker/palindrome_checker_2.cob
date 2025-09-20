IDENTIFICATION DIVISION.
PROGRAM-ID. PALINDROME-CHECKER.
AUTHOR. SIMON MIKKELSEN.

* This program checks if a given string is a palindrome.
* A palindrome is a string that reads the same forward and backward.
* The program will read a string from the user, reverse it, and then
* compare the reversed string with the original string to determine
* if it is a palindrome.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 ORIGINAL-STRING     PIC X(100).
01 REVERSED-STRING     PIC X(100).
01 STRING-LENGTH       PIC 9(03).
01 I                   PIC 9(03).
01 J                   PIC 9(03).
01 IS-PALINDROME       PIC X VALUE 'Y'.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Enter a string: " WITH NO ADVANCING.
    ACCEPT ORIGINAL-STRING.

    * Calculate the length of the string
    INSPECT ORIGINAL-STRING TALLYING STRING-LENGTH FOR CHARACTERS BEFORE INITIAL ' '.

    * Reverse the string
    MOVE 0 TO J.
    PERFORM VARYING I FROM STRING-LENGTH BY -1 UNTIL I = 0
     ADD 1 TO J
     MOVE ORIGINAL-STRING(I:1) TO REVERSED-STRING(J:1)
    END-PERFORM.

    * Compare the original string with the reversed string
    PERFORM VARYING I FROM 1 BY 1 UNTIL I > STRING-LENGTH
     IF ORIGINAL-STRING(I:1) NOT = REVERSED-STRING(I:1)
         MOVE 'N' TO IS-PALINDROME
         EXIT PERFORM
     END-IF
    END-PERFORM.

    * Display the result
    IF IS-PALINDROME = 'Y'
     DISPLAY "The string is a palindrome."
    ELSE
     DISPLAY "The string is not a palindrome."
    END-IF.

    * End of program
    STOP RUN.

