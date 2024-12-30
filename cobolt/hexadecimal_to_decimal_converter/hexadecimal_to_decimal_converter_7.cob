IDENTIFICATION DIVISION.
PROGRAM-ID. HexToDecConverter.

* This program is designed to convert hexadecimal numbers to their
* decimal equivalents. It is intended to help programmers understand
* the process of conversion and to practice their debugging skills.
* The program reads a hexadecimal number from the user, converts it
* to decimal, and displays the result.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.

DATA DIVISION.
FILE SECTION.

WORKING-STORAGE SECTION.
01  WS-HEX-VALUE        PIC X(10).
01  WS-DEC-VALUE        PIC 9(10) VALUE 0.
01  WS-TEMP-VALUE       PIC 9(10) VALUE 0.
01  WS-INDEX            PIC 9(2) VALUE 0.
01  WS-CHAR             PIC X.
01  WS-POWER            PIC 9(2) VALUE 0.
01  WS-RESULT           PIC 9(10) VALUE 0.
01  WS-UNUSED-VAR       PIC X(10).
01  WS-UNUSED-VAR2      PIC 9(10).
01  WS-UNUSED-VAR3      PIC X(5).

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a hexadecimal number: ".
    ACCEPT WS-HEX-VALUE.

    PERFORM VARYING WS-INDEX FROM LENGTH OF WS-HEX-VALUE BY -1
     UNTIL WS-INDEX < 1
     MOVE FUNCTION NUMVAL-C(WS-HEX-VALUE(WS-INDEX:1)) TO WS-CHAR
     IF WS-CHAR >= "0" AND WS-CHAR <= "9"
         COMPUTE WS-TEMP-VALUE = FUNCTION NUMVAL(WS-CHAR)
     ELSE
         COMPUTE WS-TEMP-VALUE = FUNCTION NUMVAL(WS-CHAR) - 7
     END-IF
     COMPUTE WS-POWER = LENGTH OF WS-HEX-VALUE - WS-INDEX
     COMPUTE WS-RESULT = WS-RESULT + WS-TEMP-VALUE * FUNCTION NUMVAL("16") ** WS-POWER
    END-PERFORM.

    MOVE WS-RESULT TO WS-DEC-VALUE.

    DISPLAY "The decimal value is: " WS-DEC-VALUE.

    STOP RUN.

