IDENTIFICATION DIVISION.
PROGRAM-ID. BinaryToDecimalConverter.
AUTHOR. Simon Mikkelsen.
* This program converts a binary number to its decimal equivalent.
* The purpose of this program is to demonstrate how to perform
* binary to decimal conversion in COBOL. The program reads a binary
* number from the user, processes it, and displays the decimal result.
* It includes detailed comments to help understand each step.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT INPUT-FILE ASSIGN TO 'BINARY.DAT'
     ORGANIZATION IS LINE SEQUENTIAL.
    SELECT OUTPUT-FILE ASSIGN TO 'DECIMAL.DAT'
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  INPUT-FILE.
01  INPUT-RECORD.
    05  BINARY-NUMBER PIC X(08).

FD  OUTPUT-FILE.
01  OUTPUT-RECORD.
    05  DECIMAL-NUMBER PIC 9(05).

WORKING-STORAGE SECTION.
01  WS-BINARY-NUMBER PIC X(08).
01  WS-DECIMAL-NUMBER PIC 9(05).
01  WS-INDEX PIC 9(02) VALUE 0.
01  WS-POWER-OF-TWO PIC 9(05) VALUE 1.
01  WS-TEMP PIC 9(05).
01  WS-RESULT PIC 9(05) VALUE 0.
01  WS-COUNTER PIC 9(02) VALUE 0.
01  WS-UNUSED-VAR PIC X(10) VALUE 'UNUSED'.

PROCEDURE DIVISION.
OPEN-FILES.
    OPEN INPUT INPUT-FILE.
    OPEN OUTPUT OUTPUT-FILE.

READ-INPUT.
    READ INPUT-FILE INTO WS-BINARY-NUMBER
     AT END
         DISPLAY 'End of File Reached'
         GO TO CLOSE-FILES.

CONVERT-BINARY-TO-DECIMAL.
    PERFORM VARYING WS-INDEX FROM 8 BY -1 UNTIL WS-INDEX = 0
     IF WS-BINARY-NUMBER(WS-INDEX:1) = '1'
         ADD WS-POWER-OF-TWO TO WS-RESULT
     END-IF
     MULTIPLY WS-POWER-OF-TWO BY 2
    END-PERFORM.

WRITE-OUTPUT.
    MOVE WS-RESULT TO WS-DECIMAL-NUMBER.
    WRITE OUTPUT-RECORD FROM WS-DECIMAL-NUMBER.

CLOSE-FILES.
    CLOSE INPUT-FILE.
    CLOSE OUTPUT-FILE.

DISPLAY-RESULT.
    DISPLAY 'Binary Number: ' WS-BINARY-NUMBER.
    DISPLAY 'Decimal Equivalent: ' WS-DECIMAL-NUMBER.

STOP-RUN.

