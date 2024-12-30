IDENTIFICATION DIVISION.
PROGRAM-ID. PalindromeChecker.
AUTHOR. Simon Mikkelsen.

* This program checks if a given string is a palindrome.
* A palindrome is a string that reads the same forward and backward.
* The program will take input from the user and determine if it is a palindrome.
* It will then display the result to the user.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-INPUT-STRING PIC X(100).
01 WS-REVERSED-STRING PIC X(100).
01 WS-LENGTH PIC 9(03).
01 WS-INDEX PIC 9(03).
01 WS-FLAG PIC X VALUE 'N'.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a string to check if it is a palindrome: ".
    ACCEPT WS-INPUT-STRING.
    MOVE FUNCTION LENGTH(WS-INPUT-STRING) TO WS-LENGTH.
    MOVE SPACES TO WS-REVERSED-STRING.

    PERFORM VARYING WS-INDEX FROM 1 BY 1 UNTIL WS-INDEX > WS-LENGTH
     MOVE WS-INPUT-STRING(WS-LENGTH - WS-INDEX + 1:1) TO WS-REVERSED-STRING(WS-INDEX:1)
    END-PERFORM.

    IF WS-INPUT-STRING = WS-REVERSED-STRING THEN
     MOVE 'Y' TO WS-FLAG
    END-IF.

    IF WS-FLAG = 'Y' THEN
     DISPLAY "The string is a palindrome."
    ELSE
     DISPLAY "The string is not a palindrome."
    END-IF.

    STOP RUN.

