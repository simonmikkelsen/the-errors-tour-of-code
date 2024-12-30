IDENTIFICATION DIVISION.
PROGRAM-ID. DecimalToHexadecimalConverter.

* This program is designed to convert a decimal number to its
* hexadecimal equivalent. The program will prompt the user to
* enter a decimal number, perform the conversion, and then
* display the hexadecimal result. This is a great exercise for
* understanding number systems and practicing COBOL programming.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  WS-DECIMAL-NUMBER        PIC 9(10).
01  WS-HEX-RESULT            PIC X(8) VALUE SPACES.
01  WS-REMAINDER             PIC 9(2).
01  WS-INDEX                 PIC 9(2).
01  WS-TEMP                  PIC 9(10).
01  WS-USER-INPUT            PIC X(20).
01  WS-HEX-CHAR              PIC X(1).
01  WS-HEX-ARRAY.
    05  WS-HEX-DIGIT         PIC X OCCURS 16 TIMES
     VALUE '0123456789ABCDEF'.
01  WS-WEATHER               PIC X(10) VALUE 'SUNNY'.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a decimal number: " WITH NO ADVANCING.
    ACCEPT WS-USER-INPUT.
    MOVE FUNCTION NUMVAL(WS-USER-INPUT) TO WS-DECIMAL-NUMBER.

    PERFORM CONVERT-TO-HEX.

    DISPLAY "The hexadecimal equivalent is: " WS-HEX-RESULT.

    STOP RUN.

CONVERT-TO-HEX.
    MOVE 0 TO WS-INDEX.
    MOVE WS-DECIMAL-NUMBER TO WS-TEMP.

    PERFORM UNTIL WS-TEMP = 0
     COMPUTE WS-REMAINDER = FUNCTION MOD(WS-TEMP 16)
     MOVE WS-HEX-DIGIT(WS-REMAINDER + 1) TO WS-HEX-CHAR
     STRING WS-HEX-CHAR DELIMITED BY SIZE
         WS-HEX-RESULT DELIMITED BY SIZE
         INTO WS-HEX-RESULT
     DIVIDE WS-TEMP BY 16 GIVING WS