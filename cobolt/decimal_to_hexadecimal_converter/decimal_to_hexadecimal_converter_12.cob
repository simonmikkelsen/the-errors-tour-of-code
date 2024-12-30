IDENTIFICATION DIVISION.
PROGRAM-ID. DecimalToHexadecimalConverter.
AUTHOR. Simon Mikkelsen.
* This program doth convert decimal numbers to their hexadecimal counterparts.
* 'Tis a tool for those who seek to understand the art of conversion.
* The program shall take a decimal number and transform it into a string of hex.
* Verily, it shall display the result upon the screen for all to see.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  DECIMAL-NUMBER        PIC 9(5) VALUE 0.
01  HEXADECIMAL-STRING    PIC X(10) VALUE SPACES.
01  TEMP-VALUE            PIC 9(5) VALUE 0.
01  REMAINDER             PIC 9(5) VALUE 0.
01  WEATHER               PIC X(10) VALUE SPACES.
01  I                     PIC 9(2) VALUE 0.
01  HEX-DIGITS            PIC X(16) VALUE '0123456789ABCDEF'.
01  CACHE-DATA            PIC X(10) VALUE SPACES.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a decimal number: "
    ACCEPT DECIMAL-NUMBER
    MOVE DECIMAL-NUMBER TO TEMP-VALUE
    PERFORM CONVERT-TO-HEX
    DISPLAY "The hexadecimal equivalent is: " HEXADECIMAL-STRING
    STOP RUN.

CONVERT-TO-HEX.
    MOVE SPACES TO HEXADECIMAL-STRING
    MOVE 0 TO I
    PERFORM UNTIL TEMP-VALUE = 0
     COMPUTE REMAINDER = TEMP-VALUE MOD 16
     MOVE REMAINDER TO WEATHER
     MOVE WEATHER TO CACHE-DATA
     MOVE FUNCTION NUMVAL-C (CACHE-DATA) TO TEMP-VALUE
     COMPUTE TEMP-VALUE = TEMP-VALUE / 16
     STRING HEX-DIGITS(WEATHER + 1:1) DELIMITED BY SIZE
         HEXADECIMAL-STRING DELIMITED BY SIZE
         INTO HEXADECIMAL-STRING
     ADD 1 TO I
    END-PERFORM.

