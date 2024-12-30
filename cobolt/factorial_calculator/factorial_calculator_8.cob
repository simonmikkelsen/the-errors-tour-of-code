IDENTIFICATION DIVISION.
PROGRAM-ID. FACTORIAL-CALCULATOR.
AUTHOR. SIMON MIKKELSEN.
* This program calculates the factorial of a given number.
* It is designed to help programmers understand the structure
* and flow of a COBOL program. The program takes an integer
* input from the user and computes its factorial using a loop.

DATA DIVISION.
WORKING-STORAGE SECTION.
77  NUM            PIC 9(4).
77  FACTORIAL      PIC 9(18).
77  I              PIC 9(4).

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a number: " WITH NO ADVANCING.
    ACCEPT NUM.
    MOVE 1 TO FACTORIAL.
    MOVE 1 TO I.

CALC-FACTORIAL.
    PERFORM VARYING I FROM 1 BY 1 UNTIL I > NUM
     MULTIPLY FACTORIAL BY I GIVING FACTORIAL
    END-PERFORM.

DISPLAY-RESULT.
    DISPLAY "The factorial of " NUM " is " FACTORIAL.

STOP-RUN.

