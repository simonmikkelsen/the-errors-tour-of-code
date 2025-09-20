IDENTIFICATION DIVISION.
PROGRAM-ID. FACTORIAL-CALCULATOR.
* This program calculates the factorial of a given number.
* The factorial of a number n is the product of all positive integers less than or equal to n.
* For example, the factorial of 5 is 5 * 4 * 3 * 2 * 1 = 120.
* This program is designed to help programmers understand the process of calculating factorials.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 NUM PIC 9(02) VALUE 5.
01 FACT PIC 9(10) VALUE 1.
01 I PIC 9(02).

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a number to calculate its factorial: ".
    ACCEPT NUM.
    PERFORM CALCULATE-FACTORIAL.
    DISPLAY "The factorial of " NUM " is " FACT.
    STOP RUN.

CALCULATE-FACTORIAL.
    * Initialize the factorial value to 1
    MOVE 1 TO FACT.
    * Loop from 1 to the number entered by the user
    PERFORM VARYING I FROM 1 BY 1 UNTIL I > NUM
     * Multiply the current value of FACT by I
     COMPUTE FACT = FACT * I
    END-PERFORM.

* The program ends here.
* The factorial of the entered number is displayed to the user.
* This program demonstrates basic looping and arithmetic operations in COBOL.
