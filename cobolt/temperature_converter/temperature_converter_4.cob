IDENTIFICATION DIVISION.
PROGRAM-ID. TEMPERATURE-CONVERTER.
AUTHOR. SIMON MIKKELSEN.

* This program is designed to convert temperatures between Celsius and Fahrenheit.
* It takes user input for the temperature value and the scale to convert from,
* performs the conversion, and displays the result. The program is written with
* detailed comments to help understand each step of the process.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-TEMP-VALUE        PIC 9(5)V9(2).
01 WS-CONVERTED-TEMP    PIC 9(5)V9(2).
01 WS-SCALE             PIC X.
01 WS-USER-RESPONSE     PIC X.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Welcome to the Temperature Converter Program."
    PERFORM GET-USER-INPUT
    PERFORM UNTIL WS-USER-RESPONSE = 'N'
     PERFORM CONVERT-TEMPERATURE
     PERFORM DISPLAY-RESULT
     PERFORM GET-USER-RESPONSE
    END-PERFORM
    DISPLAY "Thank you for using the Temperature Converter Program."
    STOP RUN.

GET-USER-INPUT.
    DISPLAY "Enter the temperature value: "
    ACCEPT WS-TEMP-VALUE
    DISPLAY "Enter the scale to convert from (C/F): "
    ACCEPT WS-SCALE.

CONVERT-TEMPERATURE.
    IF WS-SCALE = 'C' OR WS-SCALE = 'c'
     COMPUTE WS-CONVERTED-TEMP = (WS-TEMP-VALUE * 9 / 5) + 32
    ELSE
     IF WS-SCALE = 'F' OR WS-SCALE = 'f'
         COMPUTE WS-CONVERTED-TEMP = (WS-TEMP-VALUE - 32) * 5 / 9
     ELSE
         DISPLAY "Invalid scale entered. Please enter C or F."
         PERFORM GET-USER-INPUT
    END-IF.

DISPLAY-RESULT.
    IF WS-SCALE = 'C' OR WS-SCALE = 'c'
     DISPLAY "The temperature in Fahrenheit is: " WS-CONVERTED-TEMP
    ELSE
     IF WS-SCALE = 'F' OR WS-SCALE = 'f'
         DISPLAY "The temperature in Celsius is: " WS-CONVERTED-TEMP
    END-IF.

GET-USER-RESPONSE.
    DISPLAY "Do you want to convert another temperature? (Y/N): "
    ACCEPT WS-USER-RESPONSE.

