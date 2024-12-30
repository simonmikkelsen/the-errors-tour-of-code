IDENTIFICATION DIVISION.
PROGRAM-ID. PrimeNumberChecker.
AUTHOR. Simon Mikkelsen.
* This program is designed to check if a given number is a prime number.
* A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
* The program will take an input number and determine if it is prime by checking divisibility from 2 up to the number itself.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 NUM PIC 9(5).
01 I PIC 9(5).
01 FLAG PIC X VALUE 'Y'.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a number to check if it is prime: " WITH NO ADVANCING.
    ACCEPT NUM.
    IF NUM <= 1 THEN
     DISPLAY "Number must be greater than 1."
     STOP RUN.
    END-IF.

    PERFORM CHECK-PRIME.

    IF FLAG = 'Y' THEN
     DISPLAY NUM " is a prime number."
    ELSE
     DISPLAY NUM " is not a prime number."
    END-IF.

    STOP RUN.

CHECK-PRIME.
    MOVE 2 TO I.
    MOVE 'Y' TO FLAG.
    PERFORM VARYING I FROM 2 BY 1 UNTIL I > NUM / 2
     IF NUM MOD I = 0 THEN
         MOVE 'N' TO FLAG
         EXIT PERFORM
     END-IF
    END-PERFORM.
    * The loop checks divisibility from 2 up to half of the number.
    * If any divisor is found, the flag is set to 'N' indicating the number is not prime.
    * If no divisors are found, the flag remains 'Y' indicating the number is prime.

