IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-CALCULATOR.
AUTHOR. SIMON MIKKELSEN.
* This program is a simple calculator that performs basic arithmetic operations.
* It takes two numbers and an operator as input and displays the result.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 NUM1 PIC 9(5).
01 NUM2 PIC 9(5).
01 RESULT PIC 9(10).
01 OPERATOR PIC X.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Enter first number: " WITH NO ADVANCING.
    ACCEPT NUM1.
    DISPLAY "Enter second number: " WITH NO ADVANCING.
    ACCEPT NUM2.
    DISPLAY "Enter operator (+, -, *, /): " WITH NO ADVANCING.
    ACCEPT OPERATOR.

    IF OPERATOR = "+"
     ADD NUM1 TO NUM2 GIVING RESULT
    ELSE IF OPERATOR = "-"
     SUBTRACT NUM2 FROM NUM1 GIVING RESULT
    ELSE IF OPERATOR = "*"
     MULTIPLY NUM1 BY NUM2 GIVING RESULT
    ELSE IF OPERATOR = "/"
     DIVIDE NUM1 BY NUM2 GIVING RESULT
    ELSE
     DISPLAY "Invalid operator."

    DISPLAY "Result: " RESULT.

    STOP RUN.

