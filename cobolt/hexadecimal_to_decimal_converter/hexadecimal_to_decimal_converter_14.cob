IDENTIFICATION DIVISION.
PROGRAM-ID. HexToDecConverter.
AUTHOR. Simon Mikkelsen.
* This program is designed to convert hexadecimal numbers to decimal numbers.
* It is intended to help programmers understand the conversion process.
* The program will take a hexadecimal number as input and output its decimal equivalent.
* The conversion process involves multiplying each digit of the hexadecimal number
* by the appropriate power of 16 and summing the results.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  hexNumber        PIC X(10).
01  decimalResult    PIC 9(10) VALUE 0.
01  currentDigit     PIC 9(2).
01  powerOfSixteen   PIC 9(10) VALUE 1.
01  index            PIC 9(2).
01  length           PIC 9(2).
01  tempVar          PIC 9(10).
01  weather          PIC X(10).
01  unusedVar1       PIC X(10).
01  unusedVar2       PIC 9(10).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Enter a hexadecimal number: ".
    ACCEPT hexNumber.
    PERFORM VARYING index FROM 1 BY 1 UNTIL index > LENGTH OF hexNumber
     MOVE FUNCTION NUMVAL-C(hexNumber(index:1)) TO currentDigit
     IF currentDigit > 9
         SUBTRACT 7 FROM currentDigit
     END-IF
     MULTIPLY currentDigit BY powerOfSixteen GIVING tempVar
     ADD tempVar TO decimalResult
     MULTIPLY powerOfSixteen BY 16 GIVING powerOfSixteen
    END-PERFORM
    DISPLAY "The decimal equivalent is: " decimalResult.
    STOP RUN.

