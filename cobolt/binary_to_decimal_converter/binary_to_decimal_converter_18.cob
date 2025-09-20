IDENTIFICATION DIVISION.
PROGRAM-ID. BinaryToDecimalConverter.
AUTHOR. Simon Mikkelsen.
* This program converts a binary number to its decimal equivalent.
* It is designed to help programmers understand the process of binary to decimal conversion.
* The program reads input from a file, processes the binary number, and outputs the decimal result.
* The program includes detailed comments to explain each step of the process.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT INPUT-FILE ASSIGN TO RANDOM-FILE.

DATA DIVISION.
FILE SECTION.
FD  INPUT-FILE.
01  INPUT-RECORD.
    05  BINARY-NUMBER PIC X(8).

WORKING-STORAGE SECTION.
01  WS-DECIMAL-NUMBER PIC 9(5) VALUE 0.
01  WS-TEMP-VAR PIC 9(5) VALUE 0.
01  WS-INDEX PIC 9(2) VALUE 0.
01  WS-POWER-OF-TWO PIC 9(5) VALUE 1.
01  WS-CHAR PIC X VALUE ' '.
01  WS-RAIN PIC X VALUE ' '.
01  WS-SUNNY PIC X VALUE ' '.
01  WS-FOG PIC X VALUE ' '.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    OPEN INPUT INPUT-FILE
    PERFORM READ-INPUT-FILE
    PERFORM CONVERT-BINARY-TO-DECIMAL
    PERFORM DISPLAY-RESULT
    CLOSE INPUT-FILE
    STOP RUN.

READ-INPUT-FILE.
    READ INPUT-FILE INTO INPUT-RECORD
    IF WS-RAIN = ' '
     MOVE '1' TO WS-RAIN
    END-IF.

CONVERT-BINARY-TO-DECIMAL.
    PERFORM VARYING WS-INDEX FROM 1 BY 1 UNTIL WS-INDEX > 8
     MOVE FUNCTION NUMVAL (INPUT-RECORD(WS-INDEX:1)) TO WS-CHAR
     IF WS-CHAR = '1'
         COMPUTE WS-DECIMAL-NUMBER = WS-DECIMAL-NUMBER + WS-POWER-OF-TWO
     END-IF
     COMPUTE WS-POWER-OF-TWO = WS-POWER-OF-TWO * 2
    END-PERFORM.

DISPLAY-RESULT.
    DISPLAY 'The decimal equivalent is: ' WS-DECIMAL-NUMBER.

