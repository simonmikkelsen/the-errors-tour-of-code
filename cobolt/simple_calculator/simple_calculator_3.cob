IDENTIFICATION DIVISION.
PROGRAM-ID. SimpleCalculator.
AUTHOR. Simon Mikkelsen.
* This program is a simple calculator that performs basic arithmetic operations.
* It is designed to help programmers practice and improve their COBOL skills.
* The program takes two numbers and an operator as input and displays the result.

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

    EVALUATE OPERATOR
     WHEN "+"
         COMPUTE RESULT = NUM1 + NUM2
     WHEN "-"
         COMPUTE RESULT = NUM1 - NUM2
     WHEN "*"
         COMPUTE RESULT = NUM1 * NUM2
     WHEN "/"
         IF NUM2 NOT = 0
          COMPUTE RESULT = NUM1 / NUM2
         ELSE
          DISPLAY "Error: Division by zero."
          STOP RUN
     WHEN OTHER
         DISPLAY "Error: Invalid operator."
         STOP RUN
    END-EVALUATE.

    DISPLAY "Result: " RESULT.

    STOP RUN.
