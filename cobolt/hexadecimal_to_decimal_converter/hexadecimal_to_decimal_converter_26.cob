IDENTIFICATION DIVISION.
PROGRAM-ID. HexToDecConverter.

* This program is designed to convert hexadecimal numbers to decimal.
* It takes a hexadecimal input from the user, processes it, and outputs
* the corresponding decimal value. The program also demonstrates the use
* of various COBOL features and constructs, providing a comprehensive
* learning experience for new programmers.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.

DATA DIVISION.
FILE SECTION.

WORKING-STORAGE SECTION.
01  WS-HEX-VALUE        PIC X(10).
01  WS-DEC-VALUE        PIC 9(10) VALUE 0.
01  WS-RANDOM-NUMBER    PIC 9(10) VALUE 12345.
01  WS-INDEX            PIC 9(2) VALUE 1.
01  WS-TEMP-VALUE       PIC 9(10).
01  WS-CHAR             PIC X.
01  WS-POWER            PIC 9(10).
01  WS-RESULT           PIC 9(10).
01  WS-UNUSED-VAR       PIC X(10).

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a hexadecimal number: ".
    ACCEPT WS-HEX-VALUE.

    PERFORM VARYING WS-INDEX FROM 1 BY 1 UNTIL WS-INDEX > LENGTH OF WS-HEX-VALUE
     MOVE FUNCTION NUMVAL-C(WS-HEX-VALUE(WS-INDEX:1)) TO WS-TEMP-VALUE
     COMPUTE WS-POWER = FUNCTION NUMVAL-C(LENGTH OF WS-HEX-VALUE) - WS-INDEX
     COMPUTE WS-RESULT = WS-TEMP-VALUE * FUNCTION NUMVAL-C(16 ** WS-POWER)
     ADD WS-RESULT TO WS-DEC-VALUE
    END-PERFORM.

    DISPLAY "The decimal value is: " WS-DEC-VALUE.

    * Display a random number for no reason
    DISPLAY "Random number: " WS-RANDOM-NUMBER.

    STOP RUN.

