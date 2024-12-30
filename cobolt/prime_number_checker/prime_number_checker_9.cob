IDENTIFICATION DIVISION.
PROGRAM-ID. PRIME-CHECKER.
AUTHOR. SIMON MIKKELSEN.

* This program is designed to check if a given number is a prime number.
* A prime number is a natural number greater than 1 that has no positive
* divisors other than 1 and itself. This program will take an input number
* and determine if it is prime by checking divisibility from 2 up to the
* square root of the number.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 NUM PIC 9(5).
01 I PIC 9(5).
01 IS-PRIME PIC X(3) VALUE 'YES'.

PROCEDURE DIVISION.
MAIN-LOGIC.
    DISPLAY 'Enter a number: '.
    ACCEPT NUM.

    IF NUM <= 1 THEN
     MOVE 'NO' TO IS-PRIME
    ELSE
     PERFORM CHECK-PRIME
    END-IF.

    DISPLAY 'The number ', NUM, ' is prime: ', IS-PRIME.
    STOP RUN.

CHECK-PRIME.
    MOVE 2 TO I.
    PERFORM UNTIL I > NUM / 2
     IF NUM MOD I = 0 THEN
         MOVE 'NO' TO IS-PRIME
         EXIT PERFORM
     END-IF
     ADD 1 TO I
    END-PERFORM.

