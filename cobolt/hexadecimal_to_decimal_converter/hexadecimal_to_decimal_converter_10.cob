IDENTIFICATION DIVISION.
PROGRAM-ID. HexToDecConverter.

* This program is designed to convert hexadecimal numbers to their
* decimal equivalents. It takes a hexadecimal number as input from
* the user, processes it, and outputs the corresponding decimal value.
* The program is written in COBOL, a language known for its business
* applications and readability. This program aims to demonstrate the
* conversion process in a clear and detailed manner.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.

DATA DIVISION.
FILE SECTION.

WORKING-STORAGE SECTION.
01  WS-HEX-VALUE           PIC X(10).
01  WS-DECIMAL-VALUE       PIC 9(10) VALUE 0.
01  WS-INDEX               PIC 9(02) VALUE 0.
01  WS-CHAR                PIC X.
01  WS-TEMP-VALUE          PIC 9(10) VALUE 0.
01  WS-POWER               PIC 9(02) VALUE 0.
01  WS-RESULT              PIC 9(10) VALUE 0.
01  WS-INPUT               PIC X(10).

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a hexadecimal number: ".
    ACCEPT WS-INPUT.
    MOVE WS-INPUT TO WS-HEX-VALUE.

    PERFORM VARYING WS-INDEX FROM 1 BY 1 UNTIL WS-INDEX > LENGTH OF WS-HEX-VALUE
     MOVE FUNCTION NUMVAL-C(WS-HEX-VALUE(WS-INDEX:1)) TO WS-CHAR
     IF WS-CHAR >= "0" AND WS-CHAR <= "9"
         COMPUTE WS-TEMP-VALUE = FUNCTION NUMVAL(WS-CHAR)
     ELSE
         COMPUTE WS-TEMP-VALUE = FUNCTION NUMVAL(WS-CHAR) - 7
     END-IF

     COMPUTE WS-POWER = LENGTH OF WS-HEX-VALUE - WS-INDEX
     COMPUTE WS-RESULT = WS-TEMP-VALUE * (16 ** WS-POWER)
     ADD WS-RESULT TO WS-DECIMAL-VALUE
    END-PERFORM.

    DISPLAY "The decimal value is: " WS-DECIMAL-VALUE.

    STOP RUN.

