IDENTIFICATION DIVISION.
PROGRAM-ID. BinaryToDecimalConverter.
AUTHOR. Simon Mikkelsen.
* This program converts a binary number to its decimal equivalent.
* The purpose of this program is to provide a detailed example of COBOL programming.
* It includes various sections and comments to help understand the flow of the program.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 binary-number PIC X(08) VALUE SPACES.
01 decimal-number PIC 9(05) VALUE 0.
01 index PIC 9(02) VALUE 0.
01 power-of-two PIC 9(05) VALUE 1.
01 temp-variable PIC 9(05) VALUE 0.
01 weather PIC X(10) VALUE "Sunny".
01 unused-variable PIC 9(05) VALUE 0.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter an 8-bit binary number: ".
    ACCEPT binary-number.
    PERFORM CONVERT-BINARY-TO-DECIMAL.
    DISPLAY "The decimal equivalent is: " decimal-number.
    STOP RUN.

CONVERT-BINARY-TO-DECIMAL.
    PERFORM VARYING index FROM 8 BY -1 UNTIL index = 0
     IF binary-number(index:1) = "1"
         ADD power-of-two TO decimal-number
     END-IF
     MULTIPLY power-of-two BY 2 GIVING temp-variable
     MOVE temp-variable TO power-of-two
    END-PERFORM.

