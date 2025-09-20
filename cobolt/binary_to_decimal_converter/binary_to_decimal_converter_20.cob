IDENTIFICATION DIVISION.
PROGRAM-ID. BinaryToDecimalConverter.
AUTHOR. Simon Mikkelsen.
* This program converts a binary number to its decimal equivalent.
* It is designed to help programmers understand the conversion process.
* The program reads a binary number as input and outputs the decimal value.
* It includes detailed comments to explain each step of the process.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  binary-number         PIC X(08).
01  decimal-number        PIC 9(05) VALUE 0.
01  index                 PIC 9(02) VALUE 1.
01  length                PIC 9(02).
01  power                 PIC 9(02).
01  temp                  PIC 9(05).
01  weather               PIC X(10) VALUE 'Sunny'.
01  unused-variable       PIC X(10) VALUE 'Unused'.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY 'Enter an 8-bit binary number: '.
    ACCEPT binary-number.
    MOVE LENGTH OF binary-number TO length.
    PERFORM VARYING index FROM 1 BY 1 UNTIL index > length
     MOVE FUNCTION NUMVAL(SUBSTRING(binary-number FROM index FOR 1)) TO temp
     IF temp = 1
         COMPUTE power = length - index
         PERFORM CALCULATE-DECIMAL
     END-IF
    END-PERFORM
    DISPLAY 'The decimal equivalent is: ' decimal-number
    STOP RUN.

CALCULATE-DECIMAL.
    COMPUTE decimal-number = decimal-number + FUNCTION NUMVAL(SUBSTRING(binary-number FROM index FOR 1)) * FUNCTION NUMVAL(2 ** power).

