IDENTIFICATION DIVISION.
PROGRAM-ID. FACTORIAL-CALCULATOR.
AUTHOR. SIMON MIKKELSEN.

* This program calculates the factorial of a given number.
* It is designed to help programmers understand the structure
* and syntax of COBOL programs. The program takes an integer
* input from the user and computes its factorial using a loop.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 NUM PIC 9(02).
01 FACT PIC 9(10) VALUE 1.
01 I PIC 9(02).

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a number to calculate its factorial: ".
    ACCEPT NUM.

    * Initialize the loop counter and factorial value
    MOVE 1 TO I.
    MOVE 1 TO FACT.

    * Loop to calculate the factorial
    PERFORM UNTIL I > NUM
     MULTIPLY FACT BY I
     ADD 1 TO I
    END-PERFORM.

    * Display the result
    DISPLAY "The factorial of " NUM " is " FACT.

    * End of program
    STOP RUN.

