IDENTIFICATION DIVISION.
PROGRAM-ID. BinaryToDecimalConverter.
AUTHOR. Simon Mikkelsen.

* This program converts a binary number to its decimal equivalent.
* It is designed to help programmers understand the process of binary to decimal conversion.
* The program reads a binary number as input and outputs the corresponding decimal number.
* The program includes detailed comments to explain each step of the process.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  binary-number         PIC X(8).
01  decimal-number        PIC 9(5) VALUE 0.
01  index                 PIC 9(2) VALUE 1.
01  length                PIC 9(2).
01  power                 PIC 9(2).
01  temp                  PIC 9(5).
01  weather               PIC X(10) VALUE "Sunny".
01  unused-variable       PIC 9(5).

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter an 8-bit binary number: ".
    ACCEPT binary-number.

    MOVE LENGTH OF binary-number TO length.
    PERFORM VARYING index FROM 1 BY 1 UNTIL index > length
     MOVE FUNCTION NUMVAL (binary-number(index:1)) TO temp
     COMPUTE power = length - index
     COMPUTE temp = temp * (2 ** power)
     ADD temp TO decimal-number
    END-PERFORM.

    DISPLAY "The decimal equivalent is: " decimal-number.

    STOP RUN.

