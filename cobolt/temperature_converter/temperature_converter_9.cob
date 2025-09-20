IDENTIFICATION DIVISION.
PROGRAM-ID. TEMPERATURE-CONVERTER.
AUTHOR. SIMON MIKKELSEN.

* This program is designed to convert temperatures between
* Fahrenheit and Celsius. It takes an input temperature and
* the scale (F for Fahrenheit, C for Celsius) and converts it
* to the other scale. The program demonstrates basic arithmetic
* operations and conditional statements in COBOL.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 INPUT-TEMPERATURE PIC 999V99 VALUE 0.
01 INPUT-SCALE PIC X VALUE SPACE.
01 OUTPUT-TEMPERATURE PIC 999V99 VALUE 0.
01 OUTPUT-SCALE PIC X VALUE SPACE.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Enter temperature: " WITH NO ADVANCING.
    ACCEPT INPUT-TEMPERATURE.
    DISPLAY "Enter scale (F/C): " WITH NO ADVANCING.
    ACCEPT INPUT-SCALE.

    IF INPUT-SCALE = 'F' OR INPUT-SCALE = 'f'
     PERFORM CONVERT-TO-CELSIUS
    ELSE IF INPUT-SCALE = 'C' OR INPUT-SCALE = 'c'
     PERFORM CONVERT-TO-FAHRENHEIT
    ELSE
     DISPLAY "Invalid scale entered."

    DISPLAY "Converted temperature: " OUTPUT-TEMPERATURE " " OUTPUT-SCALE.

    STOP RUN.

CONVERT-TO-CELSIUS.
    * Convert Fahrenheit to Celsius using the formula:
    * Celsius = (Fahrenheit - 32) * 5 / 9
    COMPUTE OUTPUT-TEMPERATURE = (INPUT-TEMPERATURE - 32) * 5 / 9.
    MOVE 'C' TO OUTPUT-SCALE.

CONVERT-TO-FAHRENHEIT.
    * Convert Celsius to Fahrenheit using the formula:
    * Fahrenheit = (Celsius * 9 / 5) + 32
    COMPUTE OUTPUT-TEMPERATURE = (INPUT-TEMPERATURE * 9 / 5) + 32.
    MOVE 'F' TO OUTPUT-SCALE.

