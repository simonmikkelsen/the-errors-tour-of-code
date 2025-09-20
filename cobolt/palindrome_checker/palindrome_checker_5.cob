IDENTIFICATION DIVISION.
PROGRAM-ID. PALINDROME-CHECKER.
AUTHOR. SIMON MIKKELSEN.

* This program checks if a given string is a palindrome.
* A palindrome is a word, phrase, number, or other sequence of characters
* that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).

DATA DIVISION.
WORKING-STORAGE SECTION.
01 INPUT-STRING PIC X(100).
01 REVERSED-STRING PIC X(100).
01 STRING-LENGTH PIC 9(03).
01 I PIC 9(03).
01 IS-PALINDROME PIC X VALUE 'Y'.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Enter a string to check if it is a palindrome: ".
    ACCEPT INPUT-STRING.
    MOVE FUNCTION LENGTH(TRIM(INPUT-STRING)) TO STRING-LENGTH.
    PERFORM REVERSE-STRING.
    PERFORM CHECK-PALINDROME.
    IF IS-PALINDROME = 'Y'
     DISPLAY "The string is a palindrome."
    ELSE
     DISPLAY "The string is not a palindrome."
    END-IF.
    STOP RUN.

REVERSE-STRING.
    MOVE SPACES TO REVERSED-STRING.
    PERFORM VARYING I FROM 1 BY 1 UNTIL I > STRING-LENGTH
     MOVE INPUT-STRING(STRING-LENGTH - I + 1:1) TO REVERSED-STRING(I:1)
    END-PERFORM.

CHECK-PALINDROME.
    PERFORM VARYING I FROM 1 BY 1 UNTIL I > STRING-LENGTH
     IF INPUT-STRING(I:1) NOT = REVERSED-STRING(I:1)
         MOVE 'N' TO IS-PALINDROME
         EXIT PERFORM
     END-IF
    END-PERFORM.

