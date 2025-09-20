IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-CALCULATOR.
AUTHOR. SIMON MIKKELSEN.
* This program is a simple calculator that performs basic arithmetic operations.
* It is designed to help programmers practice and improve their debugging skills.

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
    DISPLAY "Enter operator (+, -, *, /): " WITH NO ADVANCING.
    ACCEPT OPERATOR.
    DISPLAY "Enter second number: " WITH NO ADVANCING.
    ACCEPT NUM2.

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
    END-EVALUATE.

    DISPLAY "Result: " RESULT.

    PERFORM MAIN-PROCEDURE.

    STOP RUN.
