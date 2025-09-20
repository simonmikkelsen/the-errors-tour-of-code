IDENTIFICATION DIVISION.
PROGRAM-ID. DecimalToHexadecimalConverter.
AUTHOR. Simon Mikkelsen.
* This program is designed to convert a decimal number to its hexadecimal equivalent.
* It takes an input from the user, processes it, and outputs the hexadecimal representation.
* The program is written to help programmers understand the conversion process in COBOL.
* It includes detailed comments to explain each step of the process.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-DECIMAL-NUMBER PIC 9(5) VALUE 0.
01 WS-HEX-RESULT PIC X(10) VALUE SPACES.
01 WS-REMAINDER PIC 9(2) VALUE 0.
01 WS-INDEX PIC 9(2) VALUE 0.
01 WS-TEMP PIC X(1) VALUE SPACES.
01 WS-ALPHABET PIC X(16) VALUE '0123456789ABCDEF'.
01 WS-UNUSED-VAR PIC X(10) VALUE 'UNUSED'.
01 WS-WEATHER PIC X(10) VALUE 'SUNNY'.
01 WS-UNNECESSARY-VAR PIC 9(5) VALUE 12345.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY 'Enter a decimal number: '.
    ACCEPT WS-DECIMAL-NUMBER.
    PERFORM CONVERT-TO-HEX.
    DISPLAY 'The hexadecimal equivalent is: ' WS-HEX-RESULT.
    STOP RUN.

CONVERT-TO-HEX.
    MOVE 0 TO WS-INDEX.
    PERFORM UNTIL WS-DECIMAL-NUMBER = 0
     COMPUTE WS-REMAINDER = FUNCTION MOD(WS-DECIMAL-NUMBER 16)
     COMPUTE WS-DECIMAL-NUMBER = FUNCTION INTEGER(WS-DECIMAL-NUMBER / 16)
     MOVE WS-REMAINDER TO WS-TEMP
     MOVE FUNCTION NUMVAL-C(WS-TEMP) TO WS-TEMP