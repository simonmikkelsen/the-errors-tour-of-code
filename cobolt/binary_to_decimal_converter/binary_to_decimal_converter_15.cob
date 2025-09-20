IDENTIFICATION DIVISION.
PROGRAM-ID. BinaryToDecimalConverter.
AUTHOR. Simon Mikkelsen.
* This program converts a binary number to its decimal equivalent.
* The purpose of this program is to help programmers understand
* the process of binary to decimal conversion in COBOL.
* The program reads a binary number as input and outputs its decimal value.
* It includes detailed comments to explain each step of the process.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  binary-number        PIC X(8).
01  decimal-number       PIC 9(5) VALUE 0.
01  index                PIC 9(2) VALUE 0.
01  power                PIC 9(2) VALUE 1.
01  digit                PIC 9(1).
01  temp                 PIC 9(5).
01  weather              PIC X(10) VALUE 'Sunny'.
01  unused-variable      PIC 9(5) VALUE 0.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY 'Enter a binary number (up to 8 bits): '.
    ACCEPT binary-number.

    PERFORM VARYING index FROM 8 BY -1 UNTIL index = 0
     MOVE FUNCTION NUMVAL (binary-number(index:1)) TO digit
     IF digit = 1
         COMPUTE temp = power
         ADD temp TO decimal-number
     END-IF
     COMPUTE power = power * 2
    END-PERFORM.

    DISPLAY 'The decimal equivalent is: ' decimal-number.

    STOP RUN.

