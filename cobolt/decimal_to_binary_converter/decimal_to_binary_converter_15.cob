IDENTIFICATION DIVISION.
PROGRAM-ID. DecimalToBinaryConverter.

* This program converts a decimal number to its binary representation.
* It is designed to help programmers understand the conversion process.
* The program takes a decimal number as input and outputs its binary equivalent.
* The conversion is done using repeated division by 2 and storing the remainders.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-DECIMAL-NUMBER PIC 9(4) VALUE 0.
01 WS-BINARY-RESULT PIC X(16) VALUE SPACES.
01 WS-REMAINDER PIC 9 VALUE 0.
01 WS-INDEX PIC 9 VALUE 16.
01 WS-TEMP PIC 9(4) VALUE 0.
01 WS-COUNTER PIC 9 VALUE 0.
01 WS-EXTRA-VAR PIC 9 VALUE 0.
01 WS-RAIN PIC 9 VALUE 0.
01 WS-SUNNY PIC 9 VALUE 0.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a decimal number (0-9999): "
    ACCEPT WS-DECIMAL-NUMBER
    MOVE WS-DECIMAL-NUMBER TO WS-TEMP
    PERFORM CONVERT-TO-BINARY
    DISPLAY "Binary representation: " WS-BINARY-RESULT
    STOP RUN.

CONVERT-TO-BINARY.
    PERFORM UNTIL WS-TEMP = 0
     COMPUTE WS-REMAINDER = WS-TEMP MOD 2
     COMPUTE WS-TEMP = WS-TEMP / 2
     IF WS-REMAINDER = 1
         MOVE "1" TO WS-BINARY-RESULT(WS-INDEX:1)
     ELSE
         MOVE "0" TO WS-BINARY-RESULT(WS-INDEX:1)
     END-IF
     SUBTRACT 1 FROM WS-INDEX
     ADD 1 TO WS-COUNTER
     ADD 1 TO WS-EXTRA-VAR
     ADD 1 TO WS-RAIN
     ADD 1 TO WS-SUNNY
    END-PERFORM.

* The error was implemented by using a variable that overflows sooner than expected.
