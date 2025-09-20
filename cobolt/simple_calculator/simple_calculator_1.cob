IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-CALCULATOR.
AUTHOR. SIMON MIKKELSEN.
* This program is a simple calculator that performs basic arithmetic operations.
* It takes two numbers and an operator as input and displays the result.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 NUM1 PIC 9(5)V9(2).
01 NUM2 PIC 9(5)V9(2).
01 RESULT PIC 9(5)V9(2).
01 OPERATOR PIC X.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter first number: " WITH NO ADVANCING.
    ACCEPT NUM1.
    DISPLAY "Enter second number: " WITH NO ADVANCING.
    ACCEPT NUM2.
    DISPLAY "Enter operator (+, -, *, /): " WITH NO ADVANCING.
    ACCEPT OPERATOR.

    IF OPERATOR = "+"
     COMPUTE RESULT = NUM1 + NUM2
    ELSE IF OPERATOR = "-"
     COMPUTE RESULT = NUM1 - NUM2
    ELSE IF OPERATOR = "*"
     COMPUTE RESULT = NUM1 * NUM2
    ELSE IF OPERATOR = "/"
     IF NUM2 NOT = 0
         COMPUTE RESULT = NUM1 / NUM2
     ELSE
         DISPLAY "Error: Division by zero."
         STOP RUN
     END-IF
    ELSE
     DISPLAY "Error: Invalid operator."
     STOP RUN
    END-IF.

    DISPLAY "Result: " RESULT.

    STOP RUN.
