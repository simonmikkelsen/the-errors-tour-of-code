IDENTIFICATION DIVISION.
PROGRAM-ID. DecimalToHexadecimalConverter.
AUTHOR. Simon Mikkelsen.
* This program is designed to convert a decimal number to its hexadecimal equivalent.
* The program takes an input from the user, processes it, and outputs the hexadecimal value.
* It is a great way to understand the conversion process and practice COBOL programming.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  WS-DECIMAL-NUMBER        PIC 9(10) VALUE 0.
01  WS-HEX-RESULT            PIC X(8) VALUE SPACES.
01  WS-TEMP-VAR              PIC 9(10) VALUE 0.
01  WS-REMAINDER             PIC 9(2).
01  WS-INDEX                 PIC 9(2) VALUE 0.
01  WS-HEX-CHAR              PIC X.
01  WS-HEX-TABLE             PIC X(16) VALUE '0123456789ABCDEF'.
01  WS-UNUSED-VAR            PIC X(10) VALUE 'UNUSED'.
01  WS-ANOTHER-UNUSED-VAR    PIC 9(5) VALUE 12345.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a decimal number: " WITH NO ADVANCING.
    ACCEPT WS-DECIMAL-NUMBER.

    PERFORM CONVERT-TO-HEX.

    DISPLAY "The hexadecimal equivalent is: " WS-HEX-RESULT.

    STOP RUN.