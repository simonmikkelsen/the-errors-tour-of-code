IDENTIFICATION DIVISION.
PROGRAM-ID. HexToDecConverter.
AUTHOR. Simon Mikkelsen.
* This program is designed to convert hexadecimal numbers to decimal.
* It takes a hexadecimal input from the user, processes it, and outputs
* the corresponding decimal value. The program is written in COBOL and
* demonstrates basic input/output operations, string manipulation, and
* arithmetic operations in COBOL.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  hex-input            PIC X(10).
01  decimal-output       PIC 9(10) VALUE 0.
01  hex-length           PIC 9(2).
01  index                PIC 9(2).
01  current-char         PIC X.
01  current-value        PIC 9(2).
01  power                PIC 9(2).
01  temp-decimal         PIC 9(10).
01  temp-weather         PIC 9(10).
01  temp-index           PIC 9(2).
01  temp-char            PIC X.
01  temp-value           PIC 9(2).

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a hexadecimal number: " WITH NO ADVANCING.
    ACCEPT hex-input.
    PERFORM VARYING index FROM 1 BY 1 UNTIL index > LENGTH OF hex-input
     MOVE FUNCTION NUMVAL-C (hex-input(index:1)) TO current-char
     IF current-char >= "0" AND current-char <= "9"
         COMPUTE current-value = FUNCTION NUMVAL (current-char)
     ELSE IF current-char >= "A" AND current-char <= "F"
         COMPUTE current-value = FUNCTION NUMVAL (current-char) - 55
     ELSE
         DISPLAY "Invalid hexadecimal character." 
         STOP RUN
     END-IF
     COMPUTE power = LENGTH OF hex-input - index
     COMPUTE temp-decimal = current-value * (16 ** power)
     ADD temp-decimal TO decimal-output
    END-PERFORM
    DISPLAY "The decimal value is: " decimal-output
    STOP RUN.

