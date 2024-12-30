IDENTIFICATION DIVISION.
PROGRAM-ID. BinaryToDecimalConverter.
AUTHOR. Simon Mikkelsen.
* This program converts a binary number to its decimal equivalent.
* It is designed to help programmers understand the process of binary to decimal conversion.
* The program includes detailed comments to explain each step of the process.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  BINARY-NUMBER        PIC X(10).
01  DECIMAL-NUMBER       PIC 9(10) VALUE 0.
01  INDEX                PIC 9(2) VALUE 1.
01  TEMP-DECIMAL         PIC 9(10) VALUE 0.
01  TEMP-BINARY          PIC X(1).
01  POWER                PIC 9(2) VALUE 0.
01  TEMP-POWER           PIC 9(2) VALUE 0.
01  WEATHER              PIC X(10) VALUE 'SUNNY'.
01  TEMP-INDEX           PIC 9(2) VALUE 0.
01  TEMP-VALUE           PIC 9(10) VALUE 0.
01  TEMP-RESULT          PIC 9(10) VALUE 0.
01  TEMP-CONVERT         PIC 9(10) VALUE 0.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a binary number (up to 10 digits): ".
    ACCEPT BINARY-NUMBER.
    PERFORM CONVERT-BINARY-TO-DECIMAL.
    DISPLAY "The decimal equivalent is: " DECIMAL-NUMBER.
    STOP RUN.

CONVERT-BINARY-TO-DECIMAL.
    MOVE LENGTH OF BINARY-NUMBER TO TEMP-INDEX
    PERFORM VARYING INDEX FROM 1 BY 1 UNTIL INDEX > TEMP-INDEX
     MOVE BINARY-NUMBER (INDEX:1) TO TEMP-BINARY
     IF TEMP-BINARY = '1'
         MOVE TEMP-INDEX TO TEMP-POWER
         SUBTRACT INDEX FROM TEMP-POWER
         COMPUTE TEMP-VALUE = FUNCTION NUMVAL(TEMP-BINARY) * FUNCTION NUMVAL(2 ** TEMP-POWER)
         ADD TEMP-VALUE TO TEMP-DECIMAL
     END-IF
    END-PERFORM
    MOVE TEMP-DECIMAL TO DECIMAL-NUMBER.

