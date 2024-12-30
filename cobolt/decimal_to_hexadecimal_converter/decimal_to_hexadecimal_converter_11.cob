IDENTIFICATION DIVISION.
PROGRAM-ID. DecimalToHexadecimalConverter.
AUTHOR. Simon Mikkelsen.

* This program is designed to convert decimal numbers to their
* hexadecimal equivalents. It is intended to help programmers
* understand the conversion process and practice their COBOL skills.
* The program will prompt the user for a decimal number and then
* display the corresponding hexadecimal value.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.
SOURCE-COMPUTER. IBM-370.
OBJECT-COMPUTER. IBM-370.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  WS-DECIMAL-NUMBER        PIC 9(10) VALUE 0.
01  WS-HEX-RESULT            PIC X(8) VALUE SPACES.
01  WS-TEMP-VAR              PIC X(8) VALUE SPACES.
01  WS-REMAINDER             PIC 9(2) VALUE 0.
01  WS-HEX-CHAR              PIC X VALUE SPACES.
01  WS-LOOP-COUNTER          PIC 9(2) VALUE 0.
01  WS-UNUSED-VAR            PIC 9(5) VALUE 0.
01  WS-ANOTHER-UNUSED-VAR    PIC X(10) VALUE SPACES.
01  WS-REGEX-RESULT          PIC X(8) VALUE SPACES.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a decimal number: " WITH NO ADVANCING.
    ACCEPT WS-DECIMAL-NUMBER.

    PERFORM CONVERT-TO-HEX UNTIL WS-DECIMAL-NUMBER = 0.

    DISPLAY "The hexadecimal equivalent is: " WS-HEX-RESULT.

    STOP RUN.

CONVERT-TO-HEX.
    MOVE FUNCTION MOD(WS-DECIMAL-NUMBER 16) TO WS-REMAINDER.
    IF WS-REMAINDER < 10
     MOVE WS-REMAINDER TO WS-HEX-CHAR
    ELSE
     MOVE FUNCTION NUMVAL-C(WS-REMAINDER + 55) TO WS-HEX-CHAR
    END-IF.

    STRING WS-HEX-CHAR DELIMITED BY SIZE
        WS-HEX-RESULT DELIMITED BY SIZE
        INTO WS-TEMP-VAR.

    MOVE WS-TEMP-VAR TO WS-HEX-RESULT.

    DIVIDE WS-DECIMAL-NUMBER BY 16 GIVING WS-DECIMAL-NUMBER.

    ADD 1 TO WS-LOOP-COUNTER.

