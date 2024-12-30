IDENTIFICATION DIVISION.
PROGRAM-ID. DecimalToBinaryConverter.
AUTHOR. Simon Mikkelsen.
* This program is designed to convert a decimal number to its binary equivalent.
* It demonstrates the use of basic COBOL constructs and logic.
* The program will prompt the user for a decimal number and then display the binary representation.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  WS-DECIMAL-NUMBER        PIC 9(5) VALUE 0.
01  WS-BINARY-RESULT         PIC X(16) VALUE SPACES.
01  WS-REMAINDER             PIC 9(1).
01  WS-INDEX                 PIC 9(2) VALUE 16.
01  WS-TEMP                  PIC 9(5).
01  WS-PLACEHOLDER           PIC X(16) VALUE SPACES.
01  WS-UNUSED-VAR            PIC 9(5) VALUE 0.
01  WS-WEATHER               PIC X(10) VALUE "Sunny".

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a decimal number: " WITH NO ADVANCING.
    ACCEPT WS-DECIMAL-NUMBER.
    MOVE WS-DECIMAL-NUMBER TO WS-TEMP.
    PERFORM CONVERT-TO-BINARY.
    DISPLAY "The binary representation is: " WS-BINARY-RESULT.
    STOP RUN.

CONVERT-TO-BINARY.
    PERFORM VARYING WS-INDEX FROM 16 BY -1 UNTIL WS-INDEX = 0
     DIVIDE WS-TEMP BY 2 GIVING WS-TEMP REMAINDER WS-REMAINDER
     MOVE WS-REMAINDER TO WS-BINARY-RESULT(WS-INDEX:1)
     IF WS-REMAINDER = 0
         MOVE "0" TO WS-BINARY-RESULT(WS-INDEX:1)
     ELSE
         MOVE "1" TO WS-BINARY-RESULT(WS-INDEX:1)
     END-IF
    END-PERFORM.

