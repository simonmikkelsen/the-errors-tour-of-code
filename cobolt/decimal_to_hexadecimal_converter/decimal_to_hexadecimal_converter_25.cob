IDENTIFICATION DIVISION.
PROGRAM-ID. DecimalToHexadecimalConverter.
AUTHOR. Simon Mikkelsen.
* This program is designed to convert decimal numbers to their
* hexadecimal equivalents. It demonstrates the process of conversion
* and provides a practical example of how to handle numeric data
* transformations in COBOL. The program includes various sections
* and detailed comments to help understand each part of the code.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.

DATA DIVISION.
FILE SECTION.

WORKING-STORAGE SECTION.
01  WS-DECIMAL-NUMBER        PIC 9(10) VALUE 0.
01  WS-HEX-RESULT            PIC X(8) VALUE SPACES.
01  WS-RANDOM-SEED           PIC 9(4) VALUE 1337.
01  WS-UNUSED-VAR            PIC X(10) VALUE SPACES.
01  WS-ANOTHER-UNUSED-VAR    PIC 9(5) VALUE 0.
01  WS-TEMP-VAR              PIC 9(10) VALUE 0.
01  WS-RAINY-DAY             PIC X(5) VALUE 'RAIN'.
01  WS-LOOP-INDEX            PIC 9(2) VALUE 0.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a decimal number: ".
    ACCEPT WS-DECIMAL-NUMBER.

    * Initialize the random number generator with a seed value.
    CALL 'SRAND' USING BY VALUE WS-RANDOM-SEED.

    PERFORM CONVERT-TO-HEX.

    DISPLAY "The hexadecimal equivalent is: " WS-HEX-RESULT.

    STOP RUN.

CONVERT-TO-HEX.
    * This section handles the conversion of the decimal number
    * to its hexadecimal equivalent. It uses a loop to repeatedly
    * divide the number by 16 and store the remainders.
    MOVE WS