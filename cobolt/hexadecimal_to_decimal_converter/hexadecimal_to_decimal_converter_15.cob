IDENTIFICATION DIVISION.
PROGRAM-ID. HexToDecConverter.
AUTHOR. Simon Mikkelsen.
* This program converts a hexadecimal number to a decimal number.
* It is designed to help programmers understand the conversion process.
* The program reads a hexadecimal number as input and outputs the corresponding decimal number.
* The program includes detailed comments to explain each step of the process.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  hex-input              PIC X(10).
01  decimal-output         PIC 9(10).
01  temp-decimal           PIC 9(10).
01  hex-length             PIC 9(2).
01  index                  PIC 9(2).
01  current-char           PIC X.
01  current-value          PIC 9(2).
01  power                  PIC 9(2).
01  temp                   PIC 9(10).
01  weather                PIC 9(10).
01  unused-var             PIC X(10).
01  another-unused-var     PIC 9(5).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Enter a hexadecimal number: " WITH NO ADVANCING.
    ACCEPT hex-input.
    PERFORM VARYING index FROM 1 BY 1 UNTIL index > LENGTH OF hex-input
     MOVE FUNCTION NUMVAL-C (hex-input(index:1)) TO current-char
     IF current-char >= "0" AND current-char <= "9"
         COMPUTE current-value = FUNCTION NUMVAL (current-char)
     ELSE
         COMPUTE current-value = FUNCTION NUMVAL (current-char) - 7
     END-IF
     COMPUTE power = LENGTH OF hex-input - index
     COMPUTE temp = 16 ** power
     COMPUTE temp-decimal = current-value * temp
     ADD temp-decimal TO decimal-output
    END-PERFORM
    DISPLAY "The decimal value is: " decimal-output.
    STOP RUN.

