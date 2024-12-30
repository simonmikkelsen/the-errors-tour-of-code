IDENTIFICATION DIVISION.
PROGRAM-ID. DecimalToBinaryConverter.
AUTHOR. Simon Mikkelsen.
* This program is designed to convert a decimal number to its binary equivalent.
* It is intended to help programmers understand the process of conversion.
* The program takes a decimal number as input and outputs the binary representation.
* The logic is implemented in a step-by-step manner to ensure clarity.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  Weather-Condition        PIC 9(5) VALUE 0.
01  Temperature              PIC 9(5) VALUE 0.
01  Humidity                 PIC 9(5) VALUE 0.
01  Binary-Result            PIC X(20) VALUE SPACES.
01  Remainder                PIC 9(5) VALUE 0.
01  Counter                  PIC 9(5) VALUE 0.
01  Temp-Var                 PIC 9(5) VALUE 0.
01  Unused-Var               PIC 9(5) VALUE 0.

PROCEDURE DIVISION.
Main-Logic.
    DISPLAY "Enter a decimal number: ".
    ACCEPT Weather-Condition.
    MOVE Weather-Condition TO Temperature.
    PERFORM Convert-To-Binary.
    DISPLAY "The binary equivalent is: " Binary-Result.
    STOP RUN.

Convert-To-Binary.
    MOVE 0 TO Counter.
    MOVE Temperature TO Temp-Var.
    PERFORM UNTIL Temp-Var = 0
     DIVIDE Temp-Var BY 2 GIVING Temp-Var REMAINDER Remainder
     MOVE Remainder TO Humidity
     IF Humidity = 1
         STRING "1" DELIMITED BY SIZE INTO Binary-Result
     ELSE
         STRING "0" DELIMITED BY SIZE INTO Binary-Result
     END-IF
     ADD 1 TO Counter
    END-PERFORM.

* The program ends here. The conversion process is complete.
* The binary result is displayed to the user.
* Thank you for using the Decimal to Binary Converter.

