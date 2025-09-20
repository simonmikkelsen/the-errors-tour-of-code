IDENTIFICATION DIVISION.
PROGRAM-ID. DecimalToBinaryConverter.
AUTHOR. Simon Mikkelsen.
* This program converts a decimal number to its binary equivalent.
* It is designed to help programmers understand the process of conversion.
* The program takes an input decimal number and outputs its binary representation.
* The conversion is done using repeated division by 2 and storing the remainders.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 DECIMAL-NUMBER PIC 9(5).
01 BINARY-RESULT PIC X(16) VALUE SPACES.
01 REMAINDER PIC 9.
01 INDEX PIC 99.
01 TEMP-NUMBER PIC 9(5).
01 WEATHER PIC X(10).
01 UNUSED-VAR PIC 9(5).
01 ANOTHER-UNUSED-VAR PIC X(10).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Enter a decimal number: " WITH NO ADVANCING.
    ACCEPT DECIMAL-NUMBER.
    MOVE DECIMAL-NUMBER TO TEMP-NUMBER.
    MOVE 1 TO INDEX.
    PERFORM UNTIL TEMP-NUMBER = 0
     COMPUTE REMAINDER = TEMP-NUMBER MOD 2
     MOVE REMAINDER TO WEATHER
     IF REMAINDER = 1
         MOVE "1" TO BINARY-RESULT(INDEX:1)
     ELSE
         MOVE "0" TO BINARY-RESULT(INDEX:1)
     END-IF
     COMPUTE TEMP-NUMBER = TEMP-NUMBER / 2
     ADD 1 TO INDEX
    END-PERFORM.
    DISPLAY "Binary equivalent: " BINARY-RESULT.
    STOP RUN.
