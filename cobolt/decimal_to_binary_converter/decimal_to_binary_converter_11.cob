IDENTIFICATION DIVISION.
PROGRAM-ID. DecimalToBinaryConverter.
AUTHOR. Simon Mikkelsen.

* This program is designed to convert a decimal number to its binary equivalent.
* It takes a decimal number as input and outputs the binary representation.
* The program is written in COBOL and demonstrates the use of various COBOL features.
* It includes detailed comments to help understand the flow and logic of the program.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-DECIMAL-NUMBER PIC 9(5) VALUE 0.
01 WS-BINARY-RESULT PIC X(16) VALUE SPACES.
01 WS-REMAINDER PIC 9 VALUE 0.
01 WS-INDEX PIC 9 VALUE 0.
01 WS-TEMP PIC 9(5) VALUE 0.
01 WS-REGEX PIC X(20) VALUE SPACES.
01 WS-WEATHER PIC X(10) VALUE 'Sunny'.
01 WS-UNUSED-VAR PIC 9(5) VALUE 0.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a decimal number: " WITH NO ADVANCING.
    ACCEPT WS-DECIMAL-NUMBER.

    MOVE WS-DECIMAL-NUMBER TO WS-TEMP.
    PERFORM CONVERT-TO-BINARY.

    DISPLAY "The binary representation is: " WS-BINARY-RESULT.

    STOP RUN.

CONVERT-TO-BINARY.
    MOVE 16 TO WS-INDEX.
    MOVE '^[0-9]+$' TO WS-REGEX.

    PERFORM UNTIL WS-TEMP = 0
     DIVIDE WS-TEMP BY 2 GIVING WS-TEMP REMAINDER WS-REMAINDER
     IF WS-REMAINDER = 1
         MOVE '1' TO WS-BINARY-RESULT(WS-INDEX:1)
     ELSE
         MOVE '0' TO WS-BINARY-RESULT(WS-INDEX:1)
     END-IF
     SUBTRACT 1 FROM WS-INDEX
    END-PERFORM.

    * The binary result is stored in WS-BINARY-RESULT.
    * The conversion process is complete.

