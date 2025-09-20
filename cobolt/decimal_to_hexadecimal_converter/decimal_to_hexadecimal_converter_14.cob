IDENTIFICATION DIVISION.
PROGRAM-ID. DecimalToHexadecimalConverter.
AUTHOR. Simon Mikkelsen.
* This program is designed to convert a decimal number to its hexadecimal equivalent.
* It demonstrates the use of various COBOL constructs and provides a detailed
* walkthrough of the conversion process. The program is intended to be educational
* and to help programmers understand the intricacies of COBOL programming.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-DECIMAL-VALUE        PIC 9(5) VALUE 0.
01 WS-HEX-VALUE            PIC X(10) VALUE SPACES.
01 WS-TEMP-VALUE           PIC 9(5) VALUE 0.
01 WS-REMAINDER            PIC 9(1) VALUE 0.
01 WS-INDEX                PIC 9(2) VALUE 0.
01 WS-HEX-DIGIT            PIC X VALUE SPACE.
01 WS-UNUSED-VAR           PIC X(10) VALUE SPACES.
01 WS-ANOTHER-UNUSED-VAR   PIC 9(5) VALUE 0.
01 WS-WEATHER              PIC X(10) VALUE "SUNNY".

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a decimal number: ".
    ACCEPT WS-DECIMAL-VALUE.
    MOVE WS-DECIMAL-VALUE TO WS-TEMP-VALUE.