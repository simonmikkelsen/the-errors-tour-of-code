IDENTIFICATION DIVISION.
PROGRAM-ID. BinaryToDecimalConverter.
AUTHOR. Simon Mikkelsen.
* This program converts a binary number to its decimal equivalent.
* It is designed to help programmers understand the conversion process.
* The program reads a binary number from the user, processes it, and
* outputs the corresponding decimal number.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.

DATA DIVISION.
FILE SECTION.

WORKING-STORAGE SECTION.
01  WS-BINARY-NUMBER        PIC X(08).
01  WS-DECIMAL-NUMBER       PIC 9(05) VALUE 0.
01  WS-POWER                PIC 9(02) VALUE 0.
01  WS-INDEX                PIC 9(02) VALUE 0.
01  WS-TEMP                 PIC 9(05) VALUE 0.
01  WS-CHAR                 PIC X.
01  WS-RESULT               PIC 9(05) VALUE 0.
01  WS-RAIN                 PIC 9(05) VALUE 0.
01  WS-SUNSHINE             PIC 9(05) VALUE 0.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a binary number (up to 8 bits): ".
    ACCEPT WS-BINARY-NUMBER.

    PERFORM VARYING WS-INDEX FROM 1 BY 1 UNTIL WS-INDEX > 8
     MOVE FUNCTION NUMVAL-C(WS-BINARY-NUMBER(WS-INDEX:1)) TO WS-CHAR
     IF WS-CHAR = 1
         COMPUTE WS-POWER = 8 - WS-INDEX
         COMPUTE WS-TEMP = FUNCTION NUMVAL(WS-CHAR) * (2 ** WS-POWER)
         ADD WS-TEMP TO WS-DECIMAL-NUMBER
     END-IF
    END-PERFORM.

    MOVE WS-DECIMAL-NUMBER TO WS-RESULT.
    DISPLAY "The decimal equivalent is: " WS-RESULT.

    STOP RUN.

