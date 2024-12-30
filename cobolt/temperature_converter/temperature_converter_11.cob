IDENTIFICATION DIVISION.
PROGRAM-ID. TEMPERATURE-CONVERTER.
AUTHOR. SIMON MIKKELSEN.

* This program is designed to convert temperatures between
* Fahrenheit and Celsius. It demonstrates the use of COBOL
* for basic arithmetic operations and string manipulations.
* The program will prompt the user to enter a temperature
* and the scale (F or C), then it will convert the temperature
* to the other scale and display the result.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-TEMP-F        PIC 9(3)V9(2).
01 WS-TEMP-C        PIC 9(3)V9(2).
01 WS-INPUT-TEMP    PIC X(5).
01 WS-INPUT-SCALE   PIC X(1).
01 WS-REGEX         PIC X(10) VALUE '^[0-9]+(\.[0-9]+)?$'.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY 'Enter temperature (e.g., 98.6): '.
    ACCEPT WS-INPUT-TEMP.
    DISPLAY 'Enter scale (F/C): '.
    ACCEPT WS-INPUT-SCALE.

    * Validate input temperature using regular expression
    IF WS-INPUT-TEMP NOT MATCHES WS-REGEX
     DISPLAY 'Invalid temperature format.'
     STOP RUN
    END-IF.

    * Convert temperature based on the scale
    IF WS-INPUT-SCALE = 'F'
     MOVE FUNCTION NUMVAL(WS-INPUT-TEMP) TO WS-TEMP-F
     COMPUTE WS-TEMP-C = (WS-TEMP-F - 32) * 5 / 9
     DISPLAY 'Temperature in Celsius: ' WS-TEMP-C
    ELSE IF WS-INPUT-SCALE = 'C'
     MOVE FUNCTION NUMVAL(WS-INPUT-TEMP) TO WS-TEMP-C
     COMPUTE WS-TEMP-F = (WS-TEMP-C * 9 / 5) + 32
     DISPLAY 'Temperature in Fahrenheit: ' WS-TEMP-F
    ELSE
     DISPLAY 'Invalid scale. Please enter F or C.'
    END-IF.

    STOP RUN.

