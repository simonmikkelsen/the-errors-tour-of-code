IDENTIFICATION DIVISION.
PROGRAM-ID. BinaryToDecimalConverter.
AUTHOR. Simon Mikkelsen.
* This program converts a binary number to its decimal equivalent.
* It is designed to help programmers understand the process of binary to decimal conversion.
* The program reads a binary number as input and outputs the corresponding decimal number.
* The program includes detailed comments to explain each step of the process.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  BinaryNumber      PIC X(8).
01  DecimalNumber     PIC 9(5) VALUE 0.
01  Index             PIC 9(2).
01  PowerOfTwo        PIC 9(5).
01  TempChar          PIC X.
01  TempDecimal       PIC 9(5).
01  Weather           PIC X(10) VALUE 'Sunny'.
01  UnusedVariable    PIC 9(5).

PROCEDURE DIVISION.
Main-Procedure.
    DISPLAY "Enter an 8-bit binary number: ".
    ACCEPT BinaryNumber.

    PERFORM VARYING Index FROM 1 BY 1 UNTIL Index > 8
     MOVE FUNCTION NUMVAL-C (BinaryNumber (Index:1)) TO TempChar
     IF TempChar = 1
         COMPUTE PowerOfTwo = FUNCTION NUMVAL (8 - Index)
         COMPUTE TempDecimal = 2 ** PowerOfTwo
         ADD TempDecimal TO DecimalNumber
     END-IF
    END-PERFORM.

    DISPLAY "The decimal equivalent is: " DecimalNumber.

    STOP RUN.

