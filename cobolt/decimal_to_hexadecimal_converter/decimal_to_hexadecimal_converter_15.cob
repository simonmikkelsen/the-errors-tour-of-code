IDENTIFICATION DIVISION.
PROGRAM-ID. DecimalToHexadecimalConverter.
AUTHOR. Simon Mikkelsen.
* This program converts a decimal number to its hexadecimal equivalent.
* It is designed to help programmers understand the conversion process.
* The program reads a decimal number from the user, performs the conversion,
* and then displays the hexadecimal result.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-DECIMAL-NUMBER PIC 9(5) VALUE 0.
01 WS-HEX-RESULT PIC X(10) VALUE SPACES.
01 WS-REMAINDER PIC 9(2).
01 WS-INDEX PIC 9(2) VALUE 0.
01 WS-TEMP PIC 9(5).
01 WS-CHAR PIC X.
01 WS-HEX-CHARS PIC X(16) VALUE '0123456789ABCDEF'.
01 WS-UNUSED-VAR PIC 9(5) VALUE 0.
01 WS-UNUSED-STRING PIC X(10) VALUE 'UNUSED'.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY 'Enter a decimal number: '.
    ACCEPT WS-DECIMAL-NUMBER.
    MOVE WS-DECIMAL-NUMBER TO WS-TEMP.

    PERFORM UNTIL WS-TEMP = 0
     COMPUTE WS-REMAINDER = FUNCTION MOD(WS-TEMP 16)
     COMPUTE WS-TEMP = FUNCTION INTEGER-DIVIDE(WS-TEMP 16)
     MOVE WS-REMAINDER TO WS-INDEX
     MOVE WS-HEX-CHARS(WS-INDEX + 1:1) TO WS-CHAR
     STRING WS-CHAR DELIMITED BY SIZE
         WS-HEX-RESULT DELIMITED BY SIZE
         INTO WS-HEX-RESULT
    END-PERFORM.

    DISPLAY 'Hexadecimal: ' WS-HEX-RESULT.

    STOP RUN.

