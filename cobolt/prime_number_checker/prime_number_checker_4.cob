IDENTIFICATION DIVISION.
PROGRAM-ID. PrimeNumberChecker.
AUTHOR. Simon Mikkelsen.

* This program is designed to check if a given number is a prime number.
* It takes an integer input from the user and determines if it is prime.
* A prime number is a natural number greater than 1 that has no positive
* divisors other than 1 and itself.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 NUM PIC 9(5).
01 I PIC 9(5).
01 FLAG PIC X VALUE 'Y'.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a number to check if it is prime: " WITH NO ADVANCING.
    ACCEPT NUM.

    IF NUM < 2 THEN
     DISPLAY "The number is not prime."
     STOP RUN
    END-IF.

    MOVE 2 TO I.
    PERFORM UNTIL I > NUM / 2
     IF NUM MOD I = 0 THEN
         DISPLAY "The number is not prime."
         STOP RUN
     END-IF
     ADD 1 TO I
    END-PERFORM.

    DISPLAY "The number is prime."
    STOP RUN.

