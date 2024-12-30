IDENTIFICATION DIVISION.
PROGRAM-ID. TEMPERATURE-CONVERTER.
AUTHOR. YOUR-NAME.

* This program is designed to convert temperatures between
* Fahrenheit and Celsius. It will prompt the user to enter a
* temperature and the scale (F or C) and then convert it to the
* other scale. The program demonstrates basic input, output,
* and arithmetic operations in COBOL.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-TEMP-F PIC 999V99.
01 WS-TEMP-C PIC 999V99.
01 WS-INPUT-TEMP PIC 999V99.
01 WS-SCALE PIC X.
01 WS-RESULT PIC 999V99.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter temperature: " WITH NO ADVANCING.
    ACCEPT WS-INPUT-TEMP.
    DISPLAY "Enter scale (F/C): " WITH NO ADVANCING.
    ACCEPT WS-SCALE.

    IF WS-SCALE = 'F' OR WS-SCALE = 'f'
     MOVE WS-INPUT-TEMP TO WS-TEMP-F
     PERFORM CONVERT-TO-C
    ELSE
     IF WS-SCALE = 'C' OR WS-SCALE = 'c'
         MOVE WS-INPUT-TEMP TO WS-TEMP-C
         PERFORM CONVERT-TO-F
     ELSE
         DISPLAY "Invalid scale entered."
    END-IF.

    STOP RUN.

CONVERT-TO-C.
    * Convert Fahrenheit to Celsius using the formula:
    * C = (F - 32) * 5 / 9
    COMPUTE WS-RESULT = (WS-TEMP-F - 32) * 5 / 9.
    DISPLAY "Temperature in Celsius: " WS-RESULT.

CONVERT-TO-F.
    * Convert Celsius to Fahrenheit using the formula:
    * F = (C * 9 / 5) + 32
    COMPUTE WS-RESULT = (WS-TEMP-C * 9 / 5) + 32.
    DISPLAY "Temperature in Fahrenheit: " WS-RESULT.

