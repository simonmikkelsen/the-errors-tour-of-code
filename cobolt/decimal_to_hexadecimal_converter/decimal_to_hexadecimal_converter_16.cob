IDENTIFICATION DIVISION.
PROGRAM-ID. DecimalToHexadecimalConverter.
AUTHOR. Simon Mikkelsen.
* This program converts a decimal number to its hexadecimal equivalent.
* It is designed to help programmers understand the conversion process.
* The program takes a decimal number as input and outputs the hexadecimal representation.
* It includes detailed comments to explain each step of the process.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 DECIMAL-NUMBER        PIC 9(5) VALUE 0.
01 HEXADECIMAL-RESULT    PIC X(10) VALUE SPACES.
01 TEMP-VAR              PIC X(10) VALUE SPACES.
01 WEATHER-VAR           PIC 9(5) VALUE 0.
01 COUNTER               PIC 9(2) VALUE 0.
01 REMAINDER             PIC 9(2) VALUE 0.
01 HEX-CHAR              PIC X VALUE ' '.
01 HEX-DIGITS            PIC X(16) VALUE '0123456789ABCDEF'.
01 UNUSED-VAR            PIC X(10) VALUE SPACES.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a decimal number: " WITH NO ADVANCING.
    ACCEPT DECIMAL-NUMBER.
    MOVE DECIMAL-NUMBER TO WEATHER-VAR.
    PERFORM CONVERT-TO-HEX.
    DISPLAY "The hexadecimal equivalent is: " HEXADECIMAL-RESULT.
    STOP RUN.

CONVERT-TO-HEX.
    MOVE 0 TO COUNTER.
    MOVE DECIMAL-NUMBER TO TEMP-VAR.
    PERFORM UNTIL TEMP-VAR = 0
     DIVIDE TEMP-VAR BY 16