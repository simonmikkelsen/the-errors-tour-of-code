IDENTIFICATION DIVISION.
PROGRAM-ID. FACTORIAL-CALCULATOR.
AUTHOR. SIMON MIKKELSEN.

* This program calculates the factorial of a given number.
* The factorial of a number n is the product of all positive integers less than or equal to n.
* For example, the factorial of 5 is 5 * 4 * 3 * 2 * 1 = 120.
* This program is designed to help programmers understand the process of calculating factorials in COBOL.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 NUM PIC 9(02) VALUE 0.
01 FACT PIC 9(10) VALUE 1.
01 I PIC 9(02) VALUE 1.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a number to calculate its factorial: ".
    ACCEPT NUM.

    * Initialize the factorial to 1.
    MOVE 1 TO FACT.

    * Loop from 1 to the number entered by the user.
    PERFORM VARYING I FROM 1 BY 1 UNTIL I > NUM
     * Multiply the current value of FACT by the loop counter I.
     MULTIPLY FACT BY I GIVING FACT
    END-PERFORM.

    * Display the result.
    DISPLAY "The factorial of " NUM " is " FACT.

    * End the program.
    STOP RUN.

