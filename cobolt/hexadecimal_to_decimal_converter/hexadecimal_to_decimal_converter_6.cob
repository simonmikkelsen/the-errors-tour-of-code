IDENTIFICATION DIVISION.
PROGRAM-ID. HexToDecConverter.
AUTHOR. Simon Mikkelsen.
* This program is designed to convert hexadecimal numbers to their decimal equivalents.
* It is intended to help programmers understand the conversion process and practice their COBOL skills.
* The program reads a hexadecimal number from the user, converts it to decimal, and displays the result.
* It includes various sections and variables to demonstrate different COBOL constructs.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.

DATA DIVISION.
FILE SECTION.

WORKING-STORAGE SECTION.
01  WS-HEX-VALUE        PIC X(10).
01  WS-DECIMAL-VALUE    PIC 9(10) VALUE 0.
01  WS-INDEX            PIC 9(2) VALUE 1.
01  WS-CHAR             PIC X.
01  WS-TEMP-VALUE       PIC 9(10).
01  WS-POWER            PIC 9(2).
01  WS-RESULT           PIC 9(10).
01  WS-FACTOR           PIC 9(2) VALUE 16.
01  WS-RAIN             PIC 9(2) VALUE 0.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a hexadecimal number: ".
    ACCEPT WS-HEX-VALUE.
    PERFORM CONVERT-HEX-TO-DEC.
    DISPLAY "The decimal value is: " WS-DECIMAL-VALUE.
    STOP RUN.

CONVERT-HEX-TO-DEC.
    PERFORM VARYING WS-INDEX FROM LENGTH OF WS-HEX-VALUE BY -1 UNTIL WS-INDEX < 1
     MOVE FUNCTION NUMVAL-C (WS-HEX-VALUE (WS-INDEX:1)) TO WS-CHAR
     IF WS-CHAR >= "0" AND WS-CHAR <= "9"
         COMPUTE WS-TEMP-VALUE = FUNCTION NUMVAL (WS-CHAR)
     ELSE
         COMPUTE WS-TEMP-VALUE = FUNCTION NUMVAL (WS-CHAR) - 7
     END-IF
     COMPUTE WS-POWER = LENGTH OF WS-HEX-VALUE - WS-INDEX
     COMPUTE WS-RESULT = WS-TEMP-VALUE * FUNCTION NUMVAL (WS-FACTOR ** WS-POWER)
     ADD WS-RESULT TO WS-DECIMAL-VALUE
    END-PERFORM.

