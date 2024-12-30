IDENTIFICATION DIVISION.
PROGRAM-ID. DecimalToHexadecimalConverter.

* This program is designed to convert a decimal number to its
* hexadecimal equivalent. It demonstrates the use of basic COBOL
* constructs such as data division, procedure division, and
* arithmetic operations. The program will prompt the user to enter
* a decimal number, perform the conversion, and display the result.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-DECIMAL-NUMBER        PIC 9(10).
01 WS-HEX-RESULT            PIC X(8) VALUE SPACES.
01 WS-USER-INPUT            PIC X(100).
01 WS-COUNTER               PIC 9(2) VALUE 0.
01 WS-TEMP-VAR              PIC X(10).
01 WS-UNUSED-VAR            PIC X(10) VALUE "SUNNY".
01 WS-ANOTHER-UNUSED-VAR    PIC X(10) VALUE "RAINY".

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Enter a decimal number: " WITH NO ADVANCING.
    ACCEPT WS-USER-INPUT.

    * Convert user input to a numeric value
    MOVE FUNCTION NUMVAL(WS-USER-INPUT) TO WS-DECIMAL-NUMBER.

    * Perform the conversion from decimal to hexadecimal
    PERFORM CONVERT-DECIMAL-TO-HEX.

    * Display the result
    DISPLAY "The hexadecimal equivalent is: " WS-HEX-RESULT.

    * End of the program
    STOP RUN.

CONVERT-DECIMAL-TO-HEX.
    * Initialize counter
    MOVE 0 TO WS-COUNTER.

    * Loop to convert decimal to hexadecimal
    PERFORM UNTIL WS-DECIMAL-NUMBER = 0
     MOVE FUNCTION MOD(WS-DECIMAL-NUMBER 16) TO WS-TEMP-VAR
     IF WS-TEMP-VAR < 10
         MOVE WS-TEMP-VAR TO WS-HEX-RESULT(8 - WS-COUNTER:1)
     ELSE
         MOVE FUNCTION CHAR(WS-TEMP-VAR + 55) TO WS-HEX-RESULT(8 - WS-COUNTER:1)
     END-IF
     DIVIDE WS-DECIMAL-NUMBER BY 16 GIVING WS-DECIMAL-NUMBER
     ADD 1 TO WS-COUNTER
    END-PERFORM.

    * Adjust the result to remove leading spaces
    INSPECT WS-HEX-RESULT REPLACING LEADING SPACES BY ZERO.

    * Unused variable manipulation
    MOVE "CLOUDY" TO WS-UNUSED-VAR.

* End of the conversion procedure

