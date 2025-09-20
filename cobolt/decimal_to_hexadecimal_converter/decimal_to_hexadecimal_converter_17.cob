IDENTIFICATION DIVISION.
PROGRAM-ID. DecimalToHexadecimalConverter.
AUTHOR. Simon Mikkelsen.
* This program is designed to convert a given decimal number
* into its hexadecimal equivalent. The purpose of this program
* is to provide a comprehensive example of COBOL programming
* techniques, including variable declarations, arithmetic operations,
* and output formatting. The program will prompt the user for a
* decimal number, perform the conversion, and display the result.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.

INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT RANDOM-FILE ASSIGN TO "RANDOM.TXT".

DATA DIVISION.
FILE SECTION.
FD  RANDOM-FILE.
01  RANDOM-RECORD.
    05  RANDOM-DATA PIC X(100).

WORKING-STORAGE SECTION.
01  WS-DECIMAL-NUMBER      PIC 9(10).
01  WS-HEX-RESULT          PIC X(8) VALUE SPACES.
01  WS-TEMP-VAR            PIC 9(10).
01  WS-LOOP-COUNTER        PIC 9(2).
01  WS-REMAINDER           PIC 9(2).
01  WS-HEX-DIGIT           PIC X.
01  WS-HEX-STRING          PIC X(8) VALUE SPACES.
01  WS-UNUSED-VAR          PIC X(10) VALUE "UNUSED".
01  WS-WEATHER             PIC X(10) VALUE "SUNNY".

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Enter a decimal number: ".
    ACCEPT WS-DECIMAL-NUMBER.

    MOVE WS-DECIMAL-NUMBER TO WS-TEMP-VAR.