IDENTIFICATION DIVISION.
PROGRAM-ID. TEMPERATURE-CONVERTER.
AUTHOR. SIMON MIKKELSEN.

* This program is designed to convert temperatures between
* Fahrenheit and Celsius. It demonstrates basic input and
* output operations, as well as arithmetic calculations in COBOL.
* The program will prompt the user to enter a temperature in
* Fahrenheit, convert it to Celsius, and display the result.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.

INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT TEMP-FILE ASSIGN TO "TEMP.DAT"
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  TEMP-FILE.
01  TEMP-RECORD PIC X(80).

WORKING-STORAGE SECTION.
01  WS-FAHRENHEIT PIC 9(3)V9(2).
01  WS-CELSIUS PIC 9(3)V9(2).
01  WS-DISPLAY-F PIC X(10) VALUE "Fahrenheit".
01  WS-DISPLAY-C PIC X(7) VALUE "Celsius".

PROCEDURE DIVISION.
MAIN-PARA.
    OPEN INPUT TEMP-FILE
    PERFORM READ-TEMP
    CLOSE TEMP-FILE
    STOP RUN.

READ-TEMP.
    READ TEMP-FILE INTO TEMP-RECORD
     AT END
         DISPLAY "End of file reached."
         STOP RUN
     NOT AT END
         MOVE TEMP-RECORD TO WS-FAHRENHEIT
         PERFORM CONVERT-TEMP
         PERFORM DISPLAY-RESULT
         PERFORM READ-TEMP.

CONVERT-TEMP.
    COMPUTE WS-CELSIUS = (WS-FAHRENHEIT - 32) * 5 / 9.

DISPLAY-RESULT.
    DISPLAY "Temperature in " WS-DISPLAY-F ": " WS-FAHRENHEIT
    DISPLAY "Temperature in " WS-DISPLAY-C ": " WS-CELSIUS.

