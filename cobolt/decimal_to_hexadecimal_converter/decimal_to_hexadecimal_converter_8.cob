IDENTIFICATION DIVISION.
PROGRAM-ID. DecimalToHexadecimalConverter.

* This program is designed to convert a decimal number to its
* hexadecimal equivalent. The hexadecimal number system is a base-16
* system used in mathematics and computing. It uses sixteen distinct
* symbols, 0-9 and A-F, to represent values. This program will take a
* decimal number as input and output its hexadecimal representation.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 DECIMAL-NUMBER PIC 9(5).
01 HEXADECIMAL-RESULT PIC X(10).
01 TEMP-VAR PIC 9(5).
01 WEATHER-VAR PIC 9(5).
01 COUNTER PIC 9(2).
01 REMAINDER PIC 9(2).
01 HEX-CHAR PIC X.
01 HEX-ARRAY PIC X(16) VALUE '0123456789ABCDEF'.
01 UNUSED-VAR PIC 9(5).

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a decimal number: " WITH NO ADVANCING.
    ACCEPT DECIMAL-NUMBER.

    MOVE 0 TO COUNTER.
    MOVE DECIMAL-NUMBER TO TEMP-VAR.

    PERFORM UNTIL TEMP-VAR = 0
     COMPUTE REMAINDER = TEMP-VAR MOD 16
     MOVE REMAINDER TO WEATHER-VAR
     MOVE WEATHER-VAR TO HEX-CHAR
     MOVE HEX-CHAR TO HEXADECIMAL-RESULT(COUNTER:1)
     COMPUTE TEMP-VAR = TEMP-VAR / 16
     ADD 1 TO COUNTER
    END-PERFORM.

    DISPLAY "The hexadecimal equivalent is: " WITH NO ADVANCING.
    PERFORM VARYING COUNTER FROM COUNTER BY -1 UNTIL COUNTER < 0
     DISPLAY HEXADECIMAL-RESULT(COUNTER:1) WITH NO ADVANCING
    END-PERFORM.

    DISPLAY