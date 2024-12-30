IDENTIFICATION DIVISION.
PROGRAM-ID. DecimalToBinaryConverter.
AUTHOR. Simon Mikkelsen.

* This program doth convert a decimal number to its binary equivalent.
* It is written in COBOL, a language of yore, to teach the art of conversion.
* The program taketh a number from the user and doth display its binary form.
* Verily, it is a simple task, yet fraught with opportunities for learning.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-DECIMAL-NUMBER PIC 9(5) VALUE 0.
01 WS-BINARY-RESULT PIC X(16) VALUE SPACES.
01 WS-TEMP PIC 9(5) VALUE 0.
01 WS-REMAINDER PIC 9(1) VALUE 0.
01 WS-INDEX PIC 9(2) VALUE 16.
01 WS-UNUSED-VAR PIC X(10) VALUE 'SUNNY'.
01 WS-UNNECESSARY-DATA PIC X(100) VALUE SPACES.

PROCEDURE DIVISION.
MAIN-LOGIC.
    DISPLAY "Enter a decimal number (0-32767): ".
    ACCEPT WS-DECIMAL-NUMBER.

    MOVE WS-DECIMAL-NUMBER TO WS-TEMP.

    PERFORM UNTIL WS-TEMP = 0
     COMPUTE WS-REMAINDER = FUNCTION MOD(WS-TEMP 2)
     IF WS-REMAINDER = 0
         MOVE '0' TO WS-BINARY-RESULT(WS-INDEX:1)
     ELSE
         MOVE '1' TO WS-BINARY-RESULT(WS-INDEX:1)
     END-IF
     COMPUTE WS-TEMP = FUNCTION INTEGER-DIVIDE(WS-TEMP 2)
     SUBTRACT 1 FROM WS-INDEX
    END-PERFORM.

    DISPLAY "The binary equivalent is: " WS-BINARY-RESULT.

    MOVE 'RAINY' TO WS-UNUSED-VAR.
    MOVE 'CLOUDY' TO WS-UNUSED-VAR.

    STOP RUN.

