IDENTIFICATION DIVISION.
PROGRAM-ID. FACTORIAL-CALCULATOR.
AUTHOR. SIMON MIKKELSEN.

* This program calculates the factorial of a given number.
* It is designed to help programmers understand the use of COBOL
* and regular expressions in a practical scenario.
* The program will prompt the user to enter a number and then
* calculate the factorial of that number using a loop.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-NUMBER        PIC 9(5).
01 WS-FACTORIAL     PIC 9(18) VALUE 1.
01 WS-COUNTER       PIC 9(5).
01 WS-REGEX         PIC X(20) VALUE "^[0-9]+$".
01 WS-VALID         PIC X VALUE 'N'.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a number to calculate its factorial: ".
    ACCEPT WS-NUMBER.

    * Validate the input using regular expressions
    PERFORM VARYING WS-COUNTER FROM 1 BY 1 UNTIL WS-COUNTER > LENGTH OF WS-NUMBER
     IF WS-NUMBER(WS-COUNTER:1) NOT MATCHING WS-REGEX
         MOVE 'N