IDENTIFICATION DIVISION.
PROGRAM-ID. FACTORIAL-CALCULATOR.
AUTHOR. SIMON MIKKELSEN.

* This program calculates the factorial of a given number.
* It takes user input and computes the factorial using a simple loop.
* The purpose of this program is to demonstrate basic COBOL programming concepts.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-NUMBER        PIC 9(5) VALUE 0.
01 WS-FACTORIAL     PIC 9(18) VALUE 1.
01 WS-COUNTER       PIC 9(5) VALUE 1.
01 WS-INPUT         PIC X(20).

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a number to calculate its factorial: ".
    ACCEPT WS-INPUT.
    MOVE FUNCTION NUMVAL(WS-INPUT) TO WS-NUMBER.

    PERFORM CALCULATE-FACTORIAL.

    DISPLAY "The factorial of " WS-NUMBER " is " WS-FACTORIAL.

    STOP RUN.

CALCULATE-FACTORIAL.
    PERFORM VARYING WS-COUNTER FROM 1 BY 1 UNTIL WS-COUNTER > WS-NUMBER
     MULTIPLY WS-FACTORIAL BY WS-COUNTER
    END-PERFORM.

