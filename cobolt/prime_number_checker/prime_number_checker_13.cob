IDENTIFICATION DIVISION.
PROGRAM-ID. PrimeNumberChecker.

* This program checks if a given number is a prime number.
* It uses a global variable to store the number to be checked.
* The program is designed to be verbose and easy to understand.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 NUM PIC 9(5) VALUE 0.
01 I PIC 9(5) VALUE 0.
01 FLAG PIC X VALUE 'N'.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a number to check if it is prime: " WITH NO ADVANCING.
    ACCEPT NUM.

    MOVE 2 TO I.
    MOVE 'Y' TO FLAG.

    PERFORM CHECK-PRIME UNTIL I > NUM / 2 OR FLAG = 'N'.

    IF FLAG = 'Y'
     DISPLAY NUM " is a prime number."
    ELSE
     DISPLAY NUM " is not a prime number."
    END-IF.

    STOP RUN.

CHECK-PRIME.
    IF NUM MOD I = 0
     MOVE 'N' TO FLAG
    ELSE
     ADD 1 TO I
    END-IF.

