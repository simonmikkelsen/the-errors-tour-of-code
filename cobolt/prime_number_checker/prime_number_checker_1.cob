IDENTIFICATION DIVISION.
PROGRAM-ID. PrimeNumberChecker.

* This program is designed to check if a given number is a prime number.
* A prime number is a natural number greater than 1 that has no positive
* divisors other than 1 and itself. The program will prompt the user to
* enter a number and then determine if it is a prime number.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 NUM PIC 9(5) VALUE 0.
01 I PIC 9(5) VALUE 2.
01 FLAG PIC X VALUE 'T'.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a number to check if it is a prime number: ".
    ACCEPT NUM.

    * Check if the number is less than 2, which is not a prime number.
    IF NUM < 2 THEN
     MOVE 'F' TO FLAG
    ELSE
     * Loop from 2 to the number minus one to check for factors.
     PERFORM VARYING I FROM 2 BY 1 UNTIL I >= NUM
         * If the number is divisible by any number other than 1 and itself,
         * it is not a prime number.
         IF NUM MOD I = 0 THEN
          MOVE 'F' TO FLAG
         END-IF
     END-PERFORM
    END-IF.

    * Display the result based on the FLAG value.
    IF FLAG = 'T' THEN
     DISPLAY NUM " is a prime number."
    ELSE
     DISPLAY NUM " is not a prime number."
    END-IF.

    STOP RUN.

