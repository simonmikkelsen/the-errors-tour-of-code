IDENTIFICATION DIVISION.
PROGRAM-ID. HexToDecConverter.
AUTHOR. Simon Mikkelsen.
* This program converts a hexadecimal number to a decimal number.
* It is designed to help programmers understand the conversion process.
* The program reads a hexadecimal number from the user, processes it,
* and then displays the corresponding decimal number.
* The program uses various variables and functions to achieve this.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  hex-input           PIC X(10).
01  decimal-output      PIC 9(10).
01  temp-value          PIC 9(10).
01  index               PIC 9(2) VALUE 1.
01  length              PIC 9(2).
01  current-char        PIC X.
01  power               PIC 9(2).
01  weather             PIC X(10) VALUE 'Sunny'.
01  unused-variable     PIC X(10) VALUE 'Unused'.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Enter a hexadecimal number: " WITH NO ADVANCING.
    ACCEPT hex-input.
    PERFORM VARYING index FROM 1 BY 1 UNTIL index > LENGTH OF hex-input
     MOVE FUNCTION NUMVAL-C(hex-input(index:1)) TO current-char
     IF current-char >= '0' AND current-char <= '9'
         MOVE FUNCTION NUMVAL(current-char) TO temp-value
     ELSE IF current-char >= 'A' AND current-char <= 'F'
         MOVE FUNCTION NUMVAL(current-char) - 55 TO temp-value
     END-IF
     COMPUTE power = LENGTH OF hex-input - index
     COMPUTE decimal-output = decimal-output + temp-value * (16 ** power)
    END-PERFORM
    DISPLAY "The decimal value is: " decimal-output.
    STOP RUN.

