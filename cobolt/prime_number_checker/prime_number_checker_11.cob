IDENTIFICATION DIVISION.
PROGRAM-ID. PrimeNumberChecker.

* This program is designed to check if a given number is a prime number.
* It uses regular expressions to validate the input and determine if the number is prime.
* The program is written with verbose comments to help programmers understand each step.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-NUMBER PIC 9(10).
01 WS-PRIME-FLAG PIC X VALUE 'Y'.
01 WS-REGEX PIC X(20) VALUE '^[0-9]+$'.
01 WS-INDEX PIC 9(10) VALUE 2.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a number to check if it is prime: ".
    ACCEPT WS-NUMBER.

    * Validate the input using regular expression
    IF FUNCTION NUMVAL-C(WS-NUMBER) NOT = WS-REGEX
     DISPLAY "Invalid input. Please enter a valid number."
     STOP RUN
    END-IF.

    * Check if the number is less than 2
    IF WS-NUMBER < 2
     MOVE 'N' TO WS-PRIME-FLAG
    ELSE
     PERFORM CHECK-PRIME
    END-IF.

    * Display the result
    IF WS-PRIME-FLAG = 'Y'
     DISPLAY WS-NUMBER " is a prime number."
    ELSE
     DISPLAY WS-NUMBER " is not a prime number."
    END-IF.

    STOP RUN.

CHECK-PRIME.
    * Loop to check for factors of the number
    PERFORM VARYING WS-INDEX FROM 2 BY 1 UNTIL WS-INDEX > WS-NUMBER / 2
     IF WS-NUMBER MOD WS-INDEX = 0
         MOVE 'N' TO WS-PRIME-FLAG
         EXIT PERFORM
     END-IF
    END-PERFORM.

* End of program
