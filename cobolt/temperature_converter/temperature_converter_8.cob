IDENTIFICATION DIVISION.
PROGRAM-ID. TEMPERATURE-CONVERTER.
AUTHOR. SIMON MIKKELSEN.

* This program converts temperatures between Celsius and Fahrenheit.
* It prompts the user to enter a temperature and the scale (C or F).
* It then converts the temperature to the other scale and displays the result.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 TEMPERATURE-IN        PIC 9(5)V9(2).
01 TEMPERATURE-OUT       PIC 9(5)V9(2).
01 SCALE-IN              PIC X.
01 SCALE-OUT             PIC X.
01 CONVERSION-FACTOR     PIC 9(5)V9(2) VALUE 1.8.
01 OFFSET                PIC 9(5)V9(2) VALUE 32.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Enter temperature: " WITH NO ADVANCING.
    ACCEPT TEMPERATURE-IN.
    DISPLAY "Enter scale (C/F): " WITH NO ADVANCING.
    ACCEPT SCALE-IN.

    IF SCALE-IN = 'C' OR SCALE-IN = 'c'
     COMPUTE TEMPERATURE-OUT = (TEMPERATURE-IN * CONVERSION-FACTOR) + OFFSET
     MOVE 'F' TO SCALE-OUT
    ELSE IF SCALE-IN = 'F' OR SCALE-IN = 'f'
     COMPUTE TEMPERATURE-OUT = (TEMPERATURE-IN - OFFSET) / CONVERSION-FACTOR
     MOVE 'C' TO SCALE-OUT
    ELSE
     DISPLAY "Invalid scale entered."
     STOP RUN
    END-IF.

    DISPLAY "Converted temperature: " TEMPERATURE-OUT " " SCALE-OUT.

    STOP RUN.

