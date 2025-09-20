IDENTIFICATION DIVISION.
PROGRAM-ID. DecimalToBinaryConverter.
AUTHOR. Simon Mikkelsen.
* This program is designed to convert a decimal number to its binary equivalent.
* It takes an input from the user, processes it, and outputs the binary representation.
* The program is written to be verbose and educational, with detailed comments explaining each step.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-DECIMAL-NUMBER PIC 9(5) VALUE 0.
01 WS-BINARY-RESULT PIC X(16) VALUE SPACES.
01 WS-TEMP PIC 9(5) VALUE 0.
01 WS-REMAINDER PIC 9(1) VALUE 0.
01 WS-INDEX PIC 9(2) VALUE 0.
01 WS-COUNTER PIC 9(2) VALUE 0.
01 WS-PLACEHOLDER PIC 9(2) VALUE 0.
01 WS-WEATHER PIC X(10) VALUE "Sunny".

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a decimal number (0-32767): "
    ACCEPT WS-DECIMAL-NUMBER
    MOVE WS-DECIMAL-NUMBER TO WS-TEMP
    PERFORM CONVERT-TO-BINARY
    DISPLAY "The binary equivalent is: " WS-BINARY-RESULT
    STOP RUN.

CONVERT-TO-BINARY.
    MOVE 16 TO WS-INDEX
    MOVE 1 TO WS-COUNTER
    MOVE 0 TO WS-PLACEHOLDER
    PERFORM UNTIL WS-TEMP = 0
     DIVIDE WS-TEMP BY 2 GIVING WS-TEMP REMAINDER WS-REMAINDER
     IF WS-REMAINDER = 1
         MOVE "1" TO WS-BINARY-RESULT(WS-INDEX:1)
     ELSE
         MOVE "0" TO WS-BINARY-RESULT(WS-INDEX:1)
     END-IF
     SUBTRACT 1 FROM WS-INDEX
     ADD 1 TO WS-COUNTER
    END-PERFORM.

* The program has now completed the conversion process.
* The binary result is stored in WS-BINARY-RESULT and is ready for display.
* The user can now see the binary equivalent of the entered decimal number.

