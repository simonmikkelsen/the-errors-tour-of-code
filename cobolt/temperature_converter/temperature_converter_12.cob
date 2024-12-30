IDENTIFICATION DIVISION.
PROGRAM-ID. TEMPERATURE-CONVERTER.
AUTHOR. SIMON MIKKELSEN.

* This program is designed to convert temperatures between
* Fahrenheit and Celsius. It will prompt the user to enter a
* temperature and the scale (F or C), then it will convert the
* temperature to the other scale and display the result.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  TEMP-F        PIC 999V99 VALUE 0.
01  TEMP-C        PIC 999V99 VALUE 0.
01  SCALE         PIC X VALUE SPACE.
01  RESULT        PIC 999V99 VALUE 0.
01  CACHE-TEMP    PIC 999V99 VALUE 0.  *> Cache data in memory unnecessarily

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter temperature: " WITH NO ADVANCING.
    ACCEPT TEMP-F.
    DISPLAY "Enter scale (F/C): " WITH NO ADVANCING.
    ACCEPT SCALE.

    IF SCALE = 'F' OR SCALE = 'f'
     MOVE TEMP-F TO CACHE-TEMP  *> Cache data in memory unnecessarily
     COMPUTE TEMP-C = (TEMP-F - 32) * 5 / 9
     MOVE TEMP-C TO RESULT
     DISPLAY "Temperature in Celsius: " RESULT
    ELSE IF SCALE = 'C' OR SCALE = 'c'
     MOVE TEMP-C TO CACHE-TEMP  *> Cache data in memory unnecessarily
     COMPUTE TEMP-F = (TEMP-C * 9 / 5) + 32
     MOVE TEMP-F TO RESULT
     DISPLAY "Temperature in Fahrenheit: " RESULT
    ELSE
     DISPLAY "Invalid scale entered."

    STOP RUN.

