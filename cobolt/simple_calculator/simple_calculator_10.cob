IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-CALCULATOR.
AUTHOR. SIMON MIKKELSEN.
* This program is a simple calculator that performs basic arithmetic operations.
* It takes user input for the operation and the operands, then displays the result.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-FIRST-NUMBER PIC 9(5).
01 WS-SECOND-NUMBER PIC 9(5).
01 WS-OPERATOR PIC X.
01 WS-RESULT PIC 9(10).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Enter first number: " WITH NO ADVANCING.
    ACCEPT WS-FIRST-NUMBER.
    DISPLAY "Enter operator (+, -, *, /): " WITH NO ADVANCING.
    ACCEPT WS-OPERATOR.
    DISPLAY "Enter second number: " WITH NO ADVANCING.
    ACCEPT WS-SECOND-NUMBER.

    EVALUATE WS-OPERATOR
     WHEN "+"
         COMPUTE WS-RESULT = WS-FIRST-NUMBER + WS-SECOND-NUMBER
     WHEN "-"
         COMPUTE WS-RESULT = WS-FIRST-NUMBER - WS-SECOND-NUMBER
     WHEN "*"
         COMPUTE WS-RESULT = WS-FIRST-NUMBER * WS-SECOND-NUMBER
     WHEN "/"
         IF WS-SECOND-NUMBER NOT = 0
          COMPUTE WS-RESULT = WS-FIRST-NUMBER / WS-SECOND-NUMBER
         ELSE
          DISPLAY "Error: Division by zero."
          STOP RUN
     WHEN OTHER
         DISPLAY "Error: Invalid operator."
         STOP RUN
    END-EVALUATE.

    DISPLAY "Result: " WS-RESULT.

    STOP RUN.
