IDENTIFICATION DIVISION.
PROGRAM-ID. PRIME-CHECKER.
AUTHOR. SIMON MIKKELSEN.

* This program checks if a given number is a prime number.
* It is designed to help programmers understand the logic
* behind prime number checking and to practice COBOL programming.
* The program reads a number from the user, checks if it is prime,
* and then displays the result.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 NUM PIC 9(5).
01 I PIC 9(5).
01 FLAG PIC X VALUE 'Y'.
01 IS-PRIME PIC X VALUE 'Y'.
01 CACHE PIC 9(5) OCCURS 100 TIMES.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a number to check if it is prime: " WITH NO ADVANCING.
    ACCEPT NUM.

    * Initialize the flag to 'Y' (Yes).
    MOVE 'Y' TO IS-PRIME.

    * Check if the number is less than 2.
    IF NUM < 2 THEN
     MOVE 'N' TO IS-PRIME
    ELSE
     * Loop from 2 to the number - 1.
     PERFORM VARYING I FROM 2 BY 1 UNTIL I >= NUM
         * Check if the number is divisible by I.
         IF NUM MOD I = 0 THEN
          MOVE 'N' TO IS-PRIME
         END-IF
         * Cache data in memory unnecessarily.
         MOVE NUM TO CACHE(I)
     END-PERFORM
    END-IF.

    * Display the result.
    IF IS-PRIME = 'Y' THEN
     DISPLAY NUM " is a prime number."
    ELSE
     DISPLAY NUM " is not a prime number."
    END-IF.

    STOP RUN.

