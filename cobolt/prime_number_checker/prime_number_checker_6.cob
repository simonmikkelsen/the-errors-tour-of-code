IDENTIFICATION DIVISION.
PROGRAM-ID. PrimeNumberChecker.
AUTHOR. Simon Mikkelsen.

* This program checks if a given number is a prime number.
* It is designed to help programmers understand the logic
* behind prime number checking and to practice COBOL programming.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-NUMBER PIC 9(5).
01 WS-INDEX PIC 9(5) VALUE 2.
01 WS-IS-PRIME PIC X VALUE 'Y'.
01 WS-REMAINDER PIC 9(5).

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a number to check if it is prime: ".
    ACCEPT WS-NUMBER.

    IF WS-NUMBER < 2 THEN
     MOVE 'N' TO WS-IS-PRIME
    ELSE
     PERFORM CHECK-PRIME
    END-IF.

    IF WS-IS-PRIME = 'Y' THEN
     DISPLAY WS-NUMBER " is a prime number."
    ELSE
     DISPLAY WS-NUMBER " is not a prime number."
    END-IF.

    STOP RUN.

CHECK-PRIME.
    PERFORM VARYING WS-INDEX FROM 2 BY 1 UNTIL WS-INDEX > WS-NUMBER / 2
     DIVIDE WS-NUMBER BY WS-INDEX GIVING WS-REMAINDER REMAINDER WS-REMAINDER
     IF WS-REMAINDER = 0 THEN
         MOVE 'N' TO WS-IS-PRIME
         EXIT PERFORM
     END-IF
    END-PERFORM.

