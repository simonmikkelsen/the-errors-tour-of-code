IDENTIFICATION DIVISION.
PROGRAM-ID. TEMPERATURE-CONVERTER.
AUTHOR. SIMON MIKKELSEN.

* This program converts temperatures between Celsius and Fahrenheit.
* It takes an input temperature and converts it to the other scale.
* The program demonstrates basic arithmetic operations and input/output in COBOL.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  TEMP-CELSIUS        PIC 9(3)V9(1) VALUE 0.
01  TEMP-FAHRENHEIT     PIC 9(3)V9(1) VALUE 0.
01  USER-CHOICE         PIC X VALUE SPACE.
01  WS-DISPLAY-MESSAGE  PIC X(50).

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "TEMPERATURE CONVERTER PROGRAM".
    DISPLAY "ENTER 'C' TO CONVERT CELSIUS TO FAHRENHEIT".
    DISPLAY "ENTER 'F' TO CONVERT FAHRENHEIT TO CELSIUS".
    ACCEPT USER-CHOICE.

    IF USER-CHOICE = 'C' OR USER-CHOICE = 'c'
     PERFORM CONVERT-C-TO-F
    ELSE IF USER-CHOICE = 'F' OR USER-CHOICE = 'f'
     PERFORM CONVERT-F-TO-C
    ELSE
     DISPLAY "INVALID CHOICE. PLEASE ENTER 'C' OR 'F'.".

    STOP RUN.

CONVERT-C-TO-F.
    DISPLAY "ENTER TEMPERATURE IN CELSIUS: ".
    ACCEPT TEMP-CELSIUS.
    COMPUTE TEMP-FAHRENHEIT = (TEMP-CELSIUS * 9 / 5) + 32.
    DISPLAY "TEMPERATURE IN FAHRENHEIT: " TEMP-FAHRENHEIT.

CONVERT-F-TO-C.
    DISPLAY "ENTER TEMPERATURE IN FAHRENHEIT: ".
    ACCEPT TEMP-FAHRENHEIT.
    COMPUTE TEMP-CELSIUS = (TEMP-FAHRENHEIT - 32) * 5 / 9.
    DISPLAY "TEMPERATURE IN CELSIUS: " TEMP-CELSIUS.

