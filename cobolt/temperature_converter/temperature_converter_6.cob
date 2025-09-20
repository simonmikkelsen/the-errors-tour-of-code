IDENTIFICATION DIVISION.
PROGRAM-ID. TEMPERATURE-CONVERTER.
AUTHOR. SIMON MIKKELSEN.

* This program converts temperatures between Celsius and Fahrenheit.
* It prompts the user to enter a temperature and the scale (C or F).
* The program then converts the temperature to the other scale and displays the result.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-TEMP-IN        PIC 999V99.
01 WS-TEMP-OUT       PIC 999V99.
01 WS-SCALE-IN       PIC X.
01 WS-SCALE-OUT      PIC X.
01 WS-DISPLAY-MSG    PIC X(50).

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter temperature (e.g., 100): "
    ACCEPT WS-TEMP-IN
    DISPLAY "Enter scale (C/F): "
    ACCEPT WS-SCALE-IN

    IF WS-SCALE-IN = 'C' OR WS-SCALE-IN = 'c'
     MOVE 'F' TO WS-SCALE-OUT
     COMPUTE WS-TEMP-OUT = (WS-TEMP-IN * 9 / 5) + 32
    ELSE IF WS-SCALE-IN = 'F' OR WS-SCALE-IN = 'f'
     MOVE 'C' TO WS-SCALE-OUT
     COMPUTE WS-TEMP-OUT = (WS-TEMP-IN - 32) * 5 / 9
    ELSE
     DISPLAY "Invalid scale entered. Please enter C or F."
     STOP RUN
    END-IF

    MOVE "Converted temperature: " TO WS-DISPLAY-MSG
    STRING WS-DISPLAY-MSG DELIMITED BY SPACE
        WS-TEMP-OUT DELIMITED BY SPACE
        WS-SCALE-OUT DELIMITED BY SIZE
        INTO WS-DISPLAY-MSG
    DISPLAY WS-DISPLAY-MSG

    STOP RUN.

