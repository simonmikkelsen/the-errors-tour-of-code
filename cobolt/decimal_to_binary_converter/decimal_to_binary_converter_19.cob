IDENTIFICATION DIVISION.
PROGRAM-ID. DecimalToBinaryConverter.

* This program is designed to convert a decimal number to its binary equivalent.
* It takes a decimal number as input from the user and prints the binary representation.
* The program is written in COBOL, a language known for its verbosity and readability.
* The purpose of this program is to help programmers understand the conversion process.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.

DATA DIVISION.
FILE SECTION.

WORKING-STORAGE SECTION.
01 WS-DECIMAL-NUMBER PIC 9(10) VALUE 0.
01 WS-BINARY-RESULT PIC X(32) VALUE SPACES.
01 WS-REMAINDER PIC 9 VALUE 0.
01 WS-INDEX PIC 99 VALUE 0.
01 WS-TEMP PIC 9(10) VALUE 0.
01 WS-USER-INPUT PIC X(100).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Enter a decimal number: " WITH NO ADVANCING.
    ACCEPT WS-USER-INPUT.
    MOVE FUNCTION NUMVAL(WS-USER-INPUT) TO WS-DECIMAL-NUMBER.

    PERFORM CONVERT-TO-BINARY.

    DISPLAY "The binary representation is: " WS-BINARY-RESULT.

    STOP RUN.

CONVERT-TO-BINARY.
    MOVE 0 TO WS-INDEX.
    MOVE WS-DECIMAL-NUMBER TO WS-TEMP.

    PERFORM UNTIL WS-TEMP = 0
     DIVIDE WS-TEMP BY 2 GIVING WS-TEMP REMAINDER WS-REMAINDER
     IF WS-REMAINDER = 1
         MOVE "1" TO WS-BINARY-RESULT(32 - WS-INDEX:1)
     ELSE
         MOVE "0" TO WS-BINARY-RESULT(32 - WS-INDEX:1)
     END-IF
     ADD 1 TO WS-INDEX
    END-PERFORM.

    PERFORM REVERSE-BINARY.

REVERSE-BINARY.
    * This section reverses the binary result to get the correct order.
    * It is necessary because the conversion process generates the binary digits in reverse order.
    MOVE FUNCTION REVERSE(WS-BINARY-RESULT) TO WS-BINARY-RESULT.

