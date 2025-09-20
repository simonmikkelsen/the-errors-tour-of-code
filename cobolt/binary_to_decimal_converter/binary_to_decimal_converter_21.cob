IDENTIFICATION DIVISION.
PROGRAM-ID. BinaryToDecimalConverter.
AUTHOR. Simon Mikkelsen.

* This program converts a binary number to its decimal equivalent.
* The user is prompted to enter a binary number, which is then processed
* to calculate the corresponding decimal value. The program demonstrates
* basic COBOL operations, including input/output, loops, and arithmetic.
* It is designed to help programmers understand COBOL syntax and logic.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  WS-BINARY-NUMBER       PIC X(08).
01  WS-DECIMAL-NUMBER      PIC 9(05) VALUE 0.
01  WS-INDEX               PIC 9(02) VALUE 1.
01  WS-LENGTH              PIC 9(02).
01  WS-POWER               PIC 9(02).
01  WS-TEMP                PIC 9(05).
01  WS-CHAR                PIC X.
01  WS-RESULT              PIC 9(05) VALUE 0.
01  WS-RAIN                PIC 9(05) VALUE 0.
01  WS-SUNNY               PIC 9(05) VALUE 0.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Enter a binary number (up to 8 digits): ".
    ACCEPT WS-BINARY-NUMBER.

    MOVE FUNCTION LENGTH(WS-BINARY-NUMBER) TO WS-LENGTH.

    PERFORM VARYING WS-INDEX FROM 1 BY 1 UNTIL WS-INDEX > WS-LENGTH
     MOVE WS-BINARY-NUMBER(WS-INDEX:1) TO WS-CHAR
     IF WS-CHAR = "1"
         COMPUTE WS-POWER = WS-LENGTH - WS-INDEX
         COMPUTE WS-TEMP = FUNCTION NUMVAL(WS-CHAR) * (2 ** WS-POWER)
         ADD WS-TEMP TO WS-DECIMAL-NUMBER
     END-IF
    END-PERFORM.

    MOVE WS-DECIMAL-NUMBER TO WS-RESULT.
    MOVE WS-RESULT TO WS-RAIN.

    DISPLAY "The decimal equivalent is: " WS-RAIN.

    STOP RUN.

