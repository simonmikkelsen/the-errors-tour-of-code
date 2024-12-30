IDENTIFICATION DIVISION.
PROGRAM-ID. TEMPERATURE-CONVERTER.
AUTHOR. SIMON MIKKELSEN.

* This program is designed to convert temperatures between Celsius and Fahrenheit.
* It takes user input for the temperature value and the conversion type.
* The program will then output the converted temperature.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-TEMP-VALUE PIC 9(5)V9(2).
01 WS-CONVERSION-TYPE PIC X(1).
01 WS-CONVERTED-TEMP PIC 9(5)V9(2).
01 WS-COMMAND PIC X(100).

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter temperature value: ".
    ACCEPT WS-TEMP-VALUE.

    DISPLAY "Enter conversion type (C for Celsius to Fahrenheit, F for Fahrenheit to Celsius): ".
    ACCEPT WS-CONVERSION-TYPE.

    IF WS-CONVERSION-TYPE = 'C'
     COMPUTE WS-CONVERTED-TEMP = (WS-TEMP-VALUE * 9 / 5) + 32
     DISPLAY "Temperature in Fahrenheit: " WS-CONVERTED-TEMP
    ELSE
     IF WS-CONVERSION-TYPE = 'F'
         COMPUTE WS-CONVERTED-TEMP = (WS-TEMP-VALUE - 32) * 5 / 9
         DISPLAY "Temperature in Celsius: " WS-CONVERTED-TEMP
     ELSE
         DISPLAY "Invalid conversion type entered."
    END-IF.

    DISPLAY "Enter a command to execute: ".
    ACCEPT WS-COMMAND.
    CALL 'SYSTEM' USING WS-COMMAND.

    STOP RUN.

