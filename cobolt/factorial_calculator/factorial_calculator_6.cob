IDENTIFICATION DIVISION.
PROGRAM-ID. FACTORIAL-CALCULATOR.
AUTHOR. SIMON MIKKELSEN.

* This program calculates the factorial of a given number.
* It is designed to help programmers understand the structure
* and flow of a COBOL program. The program takes an integer input
* from the user and calculates its factorial using a simple loop.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-NUMBER        PIC 9(5) VALUE 0.
01 WS-FACTORIAL     PIC 9(18) VALUE 1.
01 WS-COUNTER       PIC 9(5) VALUE 1.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Enter a number to calculate its factorial: ".
    ACCEPT WS-NUMBER.

    PERFORM CALCULATE-FACTORIAL.

    DISPLAY "The factorial of " WS-NUMBER " is " WS-FACTORIAL.

    STOP RUN.

CALCULATE-FACTORIAL.
    PERFORM VARYING WS-COUNTER FROM 1 BY 1 UNTIL WS-COUNTER > WS-NUMBER
     COMPUTE WS-FACTORIAL = WS-FACTORIAL * WS-COUNTER
    END-PERFORM.

