IDENTIFICATION DIVISION.
PROGRAM-ID. FACTORIAL-CALCULATOR.
AUTHOR. SIMON MIKKELSEN.

* This program calculates the factorial of a given number.
* It uses a global variable to store the result of the factorial calculation.
* The purpose of this program is to demonstrate the use of global variables
* and to provide a detailed example of a COBOL program with verbose comments.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 NUM PIC 9(5) VALUE 0.
01 RESULT PIC 9(18) VALUE 1.
01 I PIC 9(5) VALUE 1.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a number: " WITH NO ADVANCING.
    ACCEPT NUM.
    PERFORM CALCULATE-FACTORIAL
    DISPLAY "The factorial of " NUM " is " RESULT
    STOP RUN.

CALCULATE-FACTORIAL.
    PERFORM VARYING I FROM 1 BY 1 UNTIL I > NUM
     MULTIPLY RESULT BY I
    END-PERFORM.

