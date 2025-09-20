IDENTIFICATION DIVISION.
PROGRAM-ID. TEMPERATURE-CONVERTER.
AUTHOR. SIMON MIKKELSEN.

* This program is designed to convert temperatures between
* Fahrenheit and Celsius. It takes user input for the temperature
* value and the scale to convert from, performs the conversion,
* and displays the result. The program is intended to help 
* programmers understand basic COBOL syntax and logic.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-TEMP-F  PIC 999V99 VALUE 0.
01 WS-TEMP-C  PIC 999V99 VALUE 0.
01 WS-INPUT   PIC X(10).
01 WS-CHOICE  PIC X.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter temperature value: ".
    ACCEPT WS-INPUT.
    MOVE FUNCTION NUMVAL(WS-INPUT) TO WS-TEMP-F.

    DISPLAY "Convert to (C)elsius or (F)ahrenheit? ".
    ACCEPT WS-CHOICE.

    IF WS-CHOICE = 'C' OR WS-CHOICE = 'c'
     PERFORM CONVERT-TO-CELSIUS
    ELSE
     PERFORM CONVERT-TO-FAHRENHEIT.

    STOP RUN.

CONVERT-TO-CELSIUS.
    COMPUTE WS-TEMP-C = (WS-TEMP-F - 32) * 5 / 9.
    DISPLAY "Temperature in Celsius: " WS-TEMP-C.

CONVERT-TO-FAHRENHEIT.
    COMPUTE WS-TEMP-F = (WS-TEMP-C * 9 / 5) + 32.
    DISPLAY "Temperature in Fahrenheit: " WS-TEMP-F.

