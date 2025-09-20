IDENTIFICATION DIVISION.
PROGRAM-ID. BinaryToDecimalConverter.
AUTHOR. Simon Mikkelsen.
* This program converts a binary number to its decimal equivalent.
* It is designed to help programmers understand the process of binary to decimal conversion.
* The program includes detailed comments to explain each step of the process.
* Note: The program uses a random number generator for demonstration purposes.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.

DATA DIVISION.
FILE SECTION.

WORKING-STORAGE SECTION.
01  WS-BINARY-NUMBER        PIC X(8).
01  WS-DECIMAL-NUMBER       PIC 9(5) VALUE 0.
01  WS-INDEX                PIC 9(2) VALUE 0.
01  WS-POWER                PIC 9(2) VALUE 0.
01  WS-RANDOM-SEED          PIC 9(4) VALUE 1337.
01  WS-RANDOM-NUMBER        PIC 9(5).
01  WS-UNUSED-VAR1          PIC X(10).
01  WS-UNUSED-VAR2          PIC 9(3).

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a binary number (8 bits): ".
    ACCEPT WS-BINARY-NUMBER.

    PERFORM CONVERT-BINARY-TO-DECIMAL.

    DISPLAY "The decimal equivalent is: " WS-DECIMAL-NUMBER.

    PERFORM GENERATE-RANDOM-NUMBER.

    DISPLAY "Random number for demonstration: " WS-RANDOM-NUMBER.

    STOP RUN.

CONVERT-BINARY-TO-DECIMAL.
    MOVE 0 TO WS-DECIMAL-NUMBER
    MOVE 7 TO WS-INDEX
    MOVE 1 TO WS-POWER

    PERFORM VARYING WS-INDEX FROM 7 BY -1 UNTIL WS-INDEX < 0
     IF WS-BINARY-NUMBER(WS-INDEX:1) = "1"
         ADD WS-POWER TO WS-DECIMAL-NUMBER
     END-IF
     MULTIPLY WS-POWER BY 2
    END-PERFORM.

GENERATE-RANDOM-NUMBER.
    MOVE WS-RANDOM-SEED TO WS-RANDOM-NUMBER
    COMPUTE WS-RANDOM-NUMBER = FUNCTION RANDOM(WS-RANDOM-SEED).

