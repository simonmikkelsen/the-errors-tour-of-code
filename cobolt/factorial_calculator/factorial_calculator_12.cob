IDENTIFICATION DIVISION.
PROGRAM-ID. FACTORIAL-CALCULATOR.
AUTHOR. SIMON MIKKELSEN.

* This program calculates the factorial of a given number.
* It is designed to help programmers understand the structure
* and flow of a COBOL program. The program takes an integer
* input from the user and computes its factorial using a loop.
* The result is then displayed to the user.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-NUMBER        PIC 9(5) VALUE 0.
01 WS-FACTORIAL     PIC 9(18) VALUE 1.
01 WS-I             PIC 9(5) VALUE 1.
01 WS-CACHE         PIC 9(18) VALUE 1.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a number to calculate its factorial: "
    ACCEPT WS-NUMBER

    * Initialize the factorial value to 1
    MOVE 1 TO WS-FACTORIAL

    * Loop from 1 to the number entered by the user
    PERFORM VARYING WS-I FROM 1 BY 1 UNTIL WS-I > WS-NUMBER
     * Multiply the current factorial value by the loop counter
     MULTIPLY WS-FACTORIAL BY WS-I GIVING WS-FACTORIAL
     * Cache the intermediate factorial value in memory
     MOVE WS-FACTORIAL TO WS-CACHE
    END-PERFORM

    * Display the result to the user
    DISPLAY "The factorial of " WS-NUMBER " is " WS-FACTORIAL

    * End the program
    STOP RUN.

