IDENTIFICATION DIVISION.
PROGRAM-ID. PrimeNumberChecker.

* This program is designed to check if a given number is a prime number.
* It takes user input and determines if the number is prime.
* The program is written in COBOL and includes detailed comments for clarity.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-NUMBER PIC 9(5).
01 WS-I PIC 9(5).
01 WS-FLAG PIC X VALUE 'Y'.
01 WS-INPUT PIC X(20).

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a number to check if it is prime: ".
    ACCEPT WS-INPUT.
    MOVE FUNCTION NUMVAL(WS-INPUT) TO WS-NUMBER.

    IF WS-NUMBER < 2 THEN
     DISPLAY "The number is not prime."
     STOP RUN.
    END-IF.

    MOVE 2 TO WS-I.
    PERFORM UNTIL WS-I > WS-NUMBER / 2 OR WS-FLAG = 'N'
     IF WS-NUMBER MOD WS-I = 0 THEN
         MOVE 'N' TO WS-FLAG
     ELSE
         ADD 1 TO WS-I
     END-IF
    END-PERFORM.

    IF WS-FLAG = 'Y' THEN
     DISPLAY "The number is prime."
    ELSE
     DISPLAY "The number is not prime."
    END-IF.

    STOP RUN.

