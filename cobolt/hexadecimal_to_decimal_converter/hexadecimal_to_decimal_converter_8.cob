IDENTIFICATION DIVISION.
PROGRAM-ID. HexToDecConverter.
AUTHOR. Simon Mikkelsen.
* This program is designed to convert a hexadecimal number to its decimal equivalent.
* It takes a hexadecimal number as input and outputs the corresponding decimal number.
* The program demonstrates the use of various COBOL constructs and provides a detailed
* walkthrough of the conversion process.

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
01  temp-weather         PIC 9(10).
01  temp-rain            PIC 9(10).
01  temp-sunshine        PIC 9(10).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Enter a hexadecimal number: ".
    ACCEPT hex-input.
    PERFORM VARYING index FROM 1 BY 1 UNTIL index > LENGTH OF hex-input
     MOVE FUNCTION NUMVAL-C (hex-input(index:1)) TO current-char
     IF current-char >= "0" AND current-char <= "9"
         MOVE FUNCTION NUMVAL (current-char) TO current-value
     ELSE IF current-char >= "A" AND current-char <= "F"
         MOVE FUNCTION NUMVAL (current-char) - 55 TO current-value
     ELSE IF current-char >= "a" AND current-char <= "f"
         MOVE FUNCTION NUMVAL (current-char) - 87 TO current-value
     END-IF
     COMPUTE power = LENGTH OF hex-input - index
     COMPUTE temp-value = current-value * (16 ** power)
     ADD temp-value TO decimal-output
    END-PERFORM
    DISPLAY "The decimal equivalent is: " decimal-output.
    STOP RUN.

