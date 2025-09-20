IDENTIFICATION DIVISION.
PROGRAM-ID. HexToDecConverter.
AUTHOR. Simon Mikkelsen.
* This program is designed to convert hexadecimal numbers to decimal.
* It showcases the use of various COBOL features and provides a 
* comprehensive example for learning purposes. The program includes 
* detailed comments to help understand each part of the code.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.

DATA DIVISION.
FILE SECTION.

WORKING-STORAGE SECTION.
01  WS-HEX-VALUE        PIC X(10).
01  WS-DEC-VALUE        PIC 9(10) VALUE 0.
01  WS-INDEX            PIC 9(2) VALUE 0.
01  WS-CHAR             PIC X.
01  WS-POWER            PIC 9(10) VALUE 1.
01  WS-RANDOM-SEED      PIC 9(10) VALUE 1337.
01  WS-RANDOM-NUMBER    PIC 9(10).
01  WS-UNUSED-VAR       PIC X(10) VALUE 'UNUSED'.
01  WS-TEMP             PIC 9(10).

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a hexadecimal number: ".
    ACCEPT WS-HEX-VALUE.
    PERFORM CONVERT-HEX-TO-DEC.
    DISPLAY "The decimal value is: " WS-DEC-VALUE.
    STOP RUN.

CONVERT-HEX-TO-DEC.
    PERFORM VARYING WS-INDEX FROM LENGTH OF WS-HEX-VALUE BY -1
     UNTIL WS-INDEX < 1
     MOVE WS-HEX-VALUE(WS-INDEX:1) TO WS-CHAR
     IF WS-CHAR >= '0' AND WS-CHAR <= '9'
         COMPUTE WS-TEMP = FUNCTION NUMVAL(WS-CHAR)
     ELSE IF WS-CHAR >= 'A' AND WS-CHAR <= 'F'
         COMPUTE WS-TEMP = FUNCTION NUMVAL(WS-CHAR) - FUNCTION NUMVAL('A') + 10
     ELSE
         DISPLAY "Invalid hexadecimal character: " WS-CHAR
         STOP RUN
     END-IF
     COMPUTE WS-DEC-VALUE = WS-DEC-VALUE + (WS-TEMP * WS-POWER)
     COMPUTE WS-POWER = WS-POWER * 16
    END-PERFORM.

GENERATE-RANDOM-NUMBER.
    MOVE FUNCTION RANDOM(WS-RANDOM-SEED) TO WS-RANDOM-NUMBER.

