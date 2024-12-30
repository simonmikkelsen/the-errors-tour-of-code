IDENTIFICATION DIVISION.
PROGRAM-ID. FACTORIAL-CALCULATOR.
AUTHOR. SIMON MIKKELSEN.

* This program calculates the factorial of a given number.
* It is designed to help programmers understand the basics of COBOL programming.
* The program takes an integer input from the user and computes its factorial.
* The result is then displayed to the user.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-NUMBER        PIC 9(5) VALUE 0.
01 WS-FACTORIAL     PIC 9(18) VALUE 1.
01 WS-I             PIC 9(5) VALUE 1.
01 WS-INPUT-STRING  PIC X(5).
01 WS-INPUT-POINTER POINTER.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Enter a number to calculate its factorial: ".
    ACCEPT WS-INPUT-STRING.
    SET ADDRESS OF WS-INPUT-STRING TO WS-INPUT-POINTER
    MOVE WS-INPUT-STRING TO WS-NUMBER

    PERFORM CALCULATE-FACTORIAL

    DISPLAY "The factorial of " WS-NUMBER " is " WS-FACTORIAL.

    STOP RUN.

CALCULATE-FACTORIAL.
    PERFORM VARYING WS-I FROM 1 BY 1 UNTIL WS-I > WS-NUMBER
     MULTIPLY WS-FACTORIAL BY WS-I
    END-PERFORM.

