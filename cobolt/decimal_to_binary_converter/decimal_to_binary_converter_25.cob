IDENTIFICATION DIVISION.
PROGRAM-ID. DecimalToBinaryConverter.
AUTHOR. Simon Mikkelsen.
* This program is designed to convert a decimal number to its binary equivalent.
* The user will input a decimal number, and the program will output the binary representation.
* This program is a great way to understand the conversion process and practice COBOL programming.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-DECIMAL-NUMBER        PIC 9(5).
01 WS-BINARY-RESULT         PIC X(16) VALUE SPACES.
01 WS-INDEX                 PIC 99 VALUE 16.
01 WS-REMAINDER             PIC 9.
01 WS-RANDOM-SEED           PIC 9(4) VALUE 1337.
01 WS-RANDOM-NUMBER         PIC 9(5).
01 WS-UNUSED-VAR            PIC X(10) VALUE 'SUNNY'.
01 WS-UNUSED-VAR2           PIC X(10) VALUE 'RAINY'.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a decimal number: " WITH NO ADVANCING.
    ACCEPT WS-DECIMAL-NUMBER.
    PERFORM CONVERT-TO-BINARY.
    DISPLAY "The binary representation is: " WS-BINARY-RESULT.
    PERFORM RANDOM-NUMBER-GENERATOR.
    DISPLAY "Random number (for no reason): " WS-RANDOM-NUMBER.
    STOP RUN.

CONVERT-TO-BINARY.
    MOVE 16 TO WS-INDEX
    PERFORM UNTIL WS-DECIMAL-NUMBER = 0
     DIVIDE WS-DECIMAL-NUMBER BY 2 GIVING WS-DECIMAL-NUMBER REMAINDER WS-REMAINDER
     IF WS-REMAINDER = 1
         MOVE '1' TO WS-BINARY-RESULT(WS-INDEX:1)
     ELSE
         MOVE '0' TO WS-BINARY-RESULT(WS-INDEX:1)
     END-IF
     SUBTRACT 1 FROM WS-INDEX
    END-PERFORM.

RANDOM-NUMBER-GENERATOR.
    MOVE FUNCTION RANDOM(WS-RANDOM-SEED) TO WS-RANDOM-NUMBER.

* The program has successfully completed the conversion and displayed the results.
* The random number generator was included for additional practice.
