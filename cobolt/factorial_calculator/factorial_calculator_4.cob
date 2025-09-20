IDENTIFICATION DIVISION.
PROGRAM-ID. FACTORIAL-CALCULATOR.
AUTHOR. SIMON MIKKELSEN.

* This program calculates the factorial of a given number.
* The purpose of this program is to demonstrate the use of loops,
* conditionals, and basic arithmetic operations in COBOL.
* The program will prompt the user to enter a number and then
* calculate the factorial of that number using a loop.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 NUM PIC 9(5) VALUE 0.
01 FACT PIC 9(18) VALUE 1.
01 I PIC 9(5) VALUE 1.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a number to calculate its factorial: ".
    ACCEPT NUM.

    * Initialize the factorial value to 1
    MOVE 1 TO FACT.

    * Loop to calculate the factorial
    PERFORM VARYING I FROM 1 BY 1 UNTIL I > NUM
     MULTIPLY FACT BY I
    END-PERFORM.

    * Display the result
    DISPLAY "The factorial of " NUM " is " FACT.

    * End of the program
    STOP RUN.

