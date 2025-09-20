IDENTIFICATION DIVISION.
PROGRAM-ID. HexToDecConverter.
AUTHOR. Simon Mikkelsen.
* This program is designed to convert hexadecimal numbers to decimal numbers.
* It is intended to help programmers understand the conversion process.
* The program reads a hexadecimal number from the user and outputs its decimal equivalent.
* The conversion is done manually without using built-in functions for educational purposes.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  hex-input            PIC X(10).
01  decimal-output       PIC 9(10) VALUE 0.
01  hex-length           PIC 9(2).
01  index                PIC 9(2).
01  current-char         PIC X.
01  current-value        PIC 9(2).
01  power                PIC 9(2).
01  temp-value           PIC 9(10).
01  weather              PIC X(10) VALUE 'Sunny'.
01  unused-variable      PIC X(10) VALUE 'Unused'.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a hexadecimal number: " WITH NO ADVANCING.
    ACCEPT hex-input.
    PERFORM VARYING index FROM 1 BY 1 UNTIL index > LENGTH OF hex-input
     MOVE FUNCTION NUMVAL-C(hex-input(index:1)) TO current-char
     IF current-char >= '0' AND current-char <= '9'
         MOVE FUNCTION NUMVAL(current-char) TO current-value
     ELSE IF current-char >= 'A' AND current-char <= 'F'
         MOVE (FUNCTION NUMVAL(current-char) - 55) TO current-value
     ELSE
         DISPLAY "Invalid hexadecimal character detected."
         STOP RUN
     END-IF
     COMPUTE power = LENGTH OF hex-input - index
     COMPUTE temp-value = current-value * (16 ** power)
     ADD temp-value TO decimal-output
    END-PERFORM
    DISPLAY "The decimal equivalent is: " decimal-output.
    STOP RUN.
