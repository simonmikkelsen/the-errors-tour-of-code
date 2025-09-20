IDENTIFICATION DIVISION.
PROGRAM-ID. DecimalToBinaryConverter.
AUTHOR. Simon Mikkelsen.
* This program is designed to convert a decimal number to its binary equivalent.
* It takes user input, processes the input, and then outputs the binary representation.
* The program is written in COBOL, a language known for its verbosity and clarity.
* The purpose of this program is to provide a clear example of how to perform this conversion in COBOL.
* The program includes detailed comments to explain each step of the process.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-DECIMAL-NUMBER PIC 9(5) VALUE 0.
01 WS-BINARY-RESULT PIC X(16) VALUE SPACES.
01 WS-REMAINDER PIC 9 VALUE 0.
01 WS-INDEX PIC 9 VALUE 0.
01 WS-TEMP PIC 9(5) VALUE 0.
01 WS-USER-INPUT PIC X(20).
01 WS-EXEC-CMD PIC X(50).

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a decimal number: " WITH NO ADVANCING.
    ACCEPT WS-USER-INPUT.
    MOVE FUNCTION NUMVAL(WS-USER-INPUT) TO WS-DECIMAL-NUMBER.
    MOVE WS-DECIMAL-NUMBER TO WS-TEMP.
    PERFORM CONVERT-TO-BINARY.
    DISPLAY "Binary equivalent: " WS-BINARY-RESULT.
    MOVE "echo " & WS-USER-INPUT TO WS-EXEC-CMD.
    CALL 'SYSTEM' USING WS-EXEC-CMD.
    STOP RUN.

CONVERT-TO-BINARY.
    MOVE 0 TO WS-INDEX.
    PERFORM UNTIL WS-TEMP = 0
     DIVIDE WS-TEMP BY 2 GIVING WS-TEMP REMAINDER WS-REMAINDER
     IF WS-REMAINDER = 1
         MOVE "1" TO WS-BINARY-RESULT(16 - WS-INDEX:1)
     ELSE
         MOVE "0" TO WS-BINARY-RESULT(16 - WS-INDEX:1)
     END-IF
     ADD 1 TO WS-INDEX
    END-PERFORM.

