IDENTIFICATION DIVISION.
PROGRAM-ID. DecimalToBinaryConverter.
AUTHOR. Simon Mikkelsen.
* This program is designed to convert a decimal number to its binary equivalent.
* It takes an input from the user, processes it, and then outputs the binary representation.
* The program is written in COBOL, a language known for its verbosity and clarity.
* We will use various sections and divisions to structure the program logically.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.
SOURCE-COMPUTER. IBM-370.
OBJECT-COMPUTER. IBM-370.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-DECIMAL-NUMBER PIC 9(5).
01 WS-BINARY-RESULT PIC X(16) VALUE SPACES.
01 WS-REMAINDER PIC 9(1).
01 WS-INDEX PIC 99 VALUE 1.
01 WS-TEMP PIC 9(5).
01 WS-RAIN PIC 9(5).
01 WS-SUNNY PIC 9(5).
01 WS-FOG PIC 9(5).

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a decimal number: ".
    ACCEPT WS-DECIMAL-NUMBER.
    MOVE WS-DECIMAL-NUMBER TO WS-TEMP.
    PERFORM CONVERT-TO-BINARY.
    DISPLAY "The binary equivalent is: " WS-BINARY-RESULT.
    STOP RUN.

CONVERT-TO-BINARY.
    PERFORM UNTIL WS-TEMP = 0
     DIVIDE WS-TEMP BY 2 GIVING WS-TEMP REMAINDER WS-REMAINDER
     MOVE WS-REMAINDER TO WS-BINARY-RESULT(WS-INDEX:1)
     ADD 1 TO WS-INDEX
    END-PERFORM.
    PERFORM REVERSE-BINARY.

REVERSE-BINARY.
    MOVE FUNCTION REVERSE(WS-BINARY-RESULT) TO WS-BINARY-RESULT.

* The error was implemented here.
