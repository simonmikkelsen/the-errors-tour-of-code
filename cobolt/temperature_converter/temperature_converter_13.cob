IDENTIFICATION DIVISION.
PROGRAM-ID. TEMPERATURE-CONVERTER.
AUTHOR. SIMON MIKKELSEN.

* This program converts temperatures between Celsius and Fahrenheit.
* It demonstrates the use of global variables and provides detailed comments
* to help understand the flow of the program.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-TEMP-CELSIUS PIC 9(3)V9(2) VALUE 0.
01 WS-TEMP-FAHRENHEIT PIC 9(3)V9(2) VALUE 0.
01 WS-CHOICE PIC 9 VALUE 0.

01 GLOBAL-VARIABLES.
    05 GV-TEMP-CELSIUS PIC 9(3)V9(2) VALUE 0.
    05 GV-TEMP-FAHRENHEIT PIC 9(3)V9(2) VALUE 0.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Temperature Converter Program".
    DISPLAY "1. Convert Celsius to Fahrenheit".
    DISPLAY "2. Convert Fahrenheit to Celsius".
    DISPLAY "Enter your choice (1 or 2): ".
    ACCEPT WS-CHOICE.

    IF WS-CHOICE = 1 THEN
     PERFORM CONVERT-C-TO-F
    ELSE
     PERFORM CONVERT-F-TO-C
    END-IF.

    DISPLAY "Conversion complete.".
    STOP RUN.

CONVERT-C-TO-F.
    DISPLAY "Enter temperature in Celsius: ".
    ACCEPT WS-TEMP-CELSIUS.
    MOVE WS-TEMP-CELSIUS TO GV-TEMP-CELSIUS.
    COMPUTE GV-TEMP-FAHRENHEIT = (GV-TEMP-CELSIUS * 9 / 5) + 32.
    MOVE GV-TEMP-FAHRENHEIT TO WS-TEMP-FAHRENHEIT.
    DISPLAY "Temperature in Fahrenheit: " WS-TEMP-FAHRENHEIT.

CONVERT-F-TO-C.
    DISPLAY "Enter temperature in Fahrenheit: ".
    ACCEPT WS-TEMP-FAHRENHEIT.
    MOVE WS-TEMP-FAHRENHEIT TO GV-TEMP-FAHRENHEIT.
    COMPUTE GV-TEMP-CELSIUS = (GV-TEMP-FAHRENHEIT - 32) * 5 / 9.
    MOVE GV-TEMP-CELSIUS TO WS-TEMP-CELSIUS.
    DISPLAY "Temperature in Celsius: " WS-TEMP-CELSIUS.

