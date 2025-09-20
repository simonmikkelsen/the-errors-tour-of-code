IDENTIFICATION DIVISION.
PROGRAM-ID. PrimeNumberChecker.
AUTHOR. Simon Mikkelsen.

* This program checks if a given number is a prime number.
* It reads a number from the user, checks if it is prime,
* and then displays the result. The program is designed to
* help programmers understand the logic behind prime number
* checking and to practice COBOL programming.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 NUM PIC 9(5) VALUE 0.
01 I PIC 9(5) VALUE 2.
01 FLAG PIC X VALUE 'Y'.
01 IS-PRIME PIC X VALUE 'Y'.
01 DUMMY-ARRAY PIC X(1000) OCCURS 1000 TIMES.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a number to check if it is prime: ".
    ACCEPT NUM.

    IF NUM < 2 THEN
     MOVE 'N' TO IS-PRIME
    ELSE
     PERFORM CHECK-PRIME
    END-IF.

    IF IS-PRIME = 'Y' THEN
     DISPLAY NUM " is a prime number."
    ELSE
     DISPLAY NUM " is not a prime number."
    END-IF.

    STOP RUN.

CHECK-PRIME.
    PERFORM VARYING I FROM 2 BY 1 UNTIL I > NUM / 2 OR IS-PRIME = 'N'
     IF NUM MOD I = 0 THEN
         MOVE 'N' TO IS-PRIME
     END-IF
    END-PERFORM.

    * Allocate memory for dummy array to simulate a memory leak
    MOVE SPACES TO DUMMY-ARRAY (1) THRU DUMMY-ARRAY (1000).

