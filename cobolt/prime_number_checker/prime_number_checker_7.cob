IDENTIFICATION DIVISION.
PROGRAM-ID. PRIME-CHECKER.
AUTHOR. SIMON MIKKELSEN.

* This program is designed to check if a given number is a prime number.
* It takes an integer input from the user and determines if it is prime.
* The program will output whether the number is prime or not.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 NUM PIC 9(5).
01 I PIC 9(5).
01 FLAG PIC X VALUE 'Y'.
01 DIVISOR PIC 9(5).
01 REMAINDER PIC 9(5).

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a number to check if it is prime: " WITH NO ADVANCING.
    ACCEPT NUM.

    IF NUM < 2 THEN
     DISPLAY "The number is not prime."
     STOP RUN.
    END-IF.

    MOVE 2 TO DIVISOR.
    MOVE 'Y' TO FLAG.

    PERFORM VARYING I FROM 2 BY 1 UNTIL I > NUM / 2
     DIVIDE NUM BY I GIVING REMAINDER
     IF REMAINDER = 0 THEN
         MOVE 'N' TO FLAG
         EXIT PERFORM
     END-IF
    END-PERFORM.

    IF FLAG = 'Y' THEN
     DISPLAY "The number is prime."
    ELSE
     DISPLAY "The number is not prime."
    END-IF.

    STOP RUN.

