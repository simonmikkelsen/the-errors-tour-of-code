IDENTIFICATION DIVISION.
PROGRAM-ID. PrimeNumberChecker.
AUTHOR. Simon Mikkelsen.

* This program is designed to check if a given number is a prime number.
* A prime number is a natural number greater than 1 that has no positive
* divisors other than 1 and itself. The program will prompt the user to
* enter a number and then determine if the number is prime.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 NUM PIC 9(5).
01 I PIC 9(5).
01 FLAG PIC X VALUE 'Y'.
01 DIVISOR PIC 9(5).

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a number to check if it is prime: ".
    ACCEPT NUM.

    * Initialize the divisor to 2, the first possible divisor of a number.
    MOVE 2 TO DIVISOR.

    * Check if the number is less than 2, which is not prime.
    IF NUM < 2 THEN
     MOVE 'N' TO FLAG
    ELSE
     * Loop through possible divisors to check for factors.
     PERFORM VARYING I FROM 2 BY 1 UNTIL I > NUM / 2 OR FLAG = 'N'
         IF NUM MOD I = 0 THEN
          MOVE 'N' TO FLAG
         END-IF
     END-PERFORM
    END-IF.

    * Display the result based on the flag.
    IF FLAG = 'Y' THEN
     DISPLAY NUM " is a prime number."
    ELSE
     DISPLAY NUM " is not a prime number."
    END-IF.

    STOP RUN.

