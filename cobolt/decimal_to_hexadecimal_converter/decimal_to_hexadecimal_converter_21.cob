IDENTIFICATION DIVISION.
PROGRAM-ID. DecimalToHexadecimalConverter.

* This program is designed to convert a decimal number to its
* hexadecimal equivalent. The user will be prompted to enter a
* decimal number, and the program will output the corresponding
* hexadecimal value. This program is an excellent exercise for
* understanding number systems and practicing COBOL programming.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.

DATA DIVISION.
FILE SECTION.

WORKING-STORAGE SECTION.
01  WS-DECIMAL-NUMBER      PIC 9(10) VALUE 0.
01  WS-HEX-RESULT          PIC X(8) VALUE SPACES.
01  WS-REMAINDER           PIC 9(2).
01  WS-INDEX               PIC 9(2) VALUE 0.
01  WS-TEMP                PIC 9(10).
01  WS-HEX-DIGIT           PIC X.
01  WS-HEX-ARRAY.
    05  WS-HEX-ARRAY-ITEM  OCCURS 16 TIMES PIC X VALUE SPACES.
01  WS-USER-INPUT          PIC 9(10).

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a decimal number: " WITH NO ADVANCING.
    ACCEPT WS-USER-INPUT.
    MOVE WS-USER-INPUT TO WS-DECIMAL-NUMBER.

    PERFORM CONVERT-TO-HEX.

    DISPLAY "The hexadecimal equivalent is: " WS-HEX-RESULT.

    STOP RUN.

CONVERT-TO-HEX.
    MOVE 0 TO WS-INDEX.
    MOVE WS-DECIMAL-NUMBER TO WS-TEMP.

    PERFORM UNTIL WS-TEMP = 0
     DIVIDE WS-TEMP BY 16 GIVING WS-TEMP REMAINDER WS-REMAINDER
     ADD 1 TO WS-INDEX
     MOVE WS