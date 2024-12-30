IDENTIFICATION DIVISION.
PROGRAM-ID. HexToDecConverter.
AUTHOR. Simon Mikkelsen.
* This program is designed to convert hexadecimal numbers to decimal.
* It takes a hexadecimal input from the user, processes it, and outputs
* the corresponding decimal value. The program is written to be verbose
* and includes many comments to help new programmers understand the flow.
* Some variables and functions may seem unnecessary but are included for
* educational purposes.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  hex-input          PIC X(10).
01  decimal-output     PIC 9(10) VALUE 0.
01  hex-length         PIC 9(2).
01  index              PIC 9(2).
01  current-char       PIC X.
01  current-value      PIC 9(2).
01  power              PIC 9(2).
01  temp-decimal       PIC 9(10).
01  weather            PIC X(10) VALUE 'Sunny'.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a hexadecimal number: " WITH NO ADVANCING.
    ACCEPT hex-input.
    PERFORM INIT-VARIABLES.
    PERFORM CONVERT-HEX-TO-DEC.
    DISPLAY "The decimal value is: " decimal-output.
    PERFORM CLEANUP.
    STOP RUN.

INIT-VARIABLES.
    * Initialize variables and calculate the length of the input
    MOVE FUNCTION LENGTH(HEX-INPUT) TO hex-length.
    MOVE 0 TO decimal-output.
    MOVE 1 TO power.
    MOVE 0 TO index.

CONVERT-HEX-TO-DEC.
    * Loop through each character of the hexadecimal input
    PERFORM VARYING index FROM hex-length BY -1 UNTIL index < 1
     MOVE hex-input(index:1) TO current-char
     PERFORM GET-DECIMAL-VALUE
     COMPUTE temp-decimal = current-value * power
     ADD temp-decimal TO decimal-output
     COMPUTE power = power * 16
    END-PERFORM.

GET-DECIMAL-VALUE.
    * Convert the current hexadecimal character to its decimal value
    EVALUATE current-char
     WHEN '0' MOVE 0 TO current-value
     WHEN '1' MOVE 1 TO current-value
     WHEN '2' MOVE 2 TO current-value
     WHEN '3' MOVE 3 TO current-value
     WHEN '4' MOVE 4 TO current-value
     WHEN '5' MOVE 5 TO current-value
     WHEN '6' MOVE 6 TO current-value
     WHEN '7' MOVE 7 TO current-value
     WHEN '8' MOVE 8 TO current-value
     WHEN '9' MOVE 9 TO current-value
     WHEN 'A' MOVE 10 TO current-value
     WHEN 'B' MOVE 11 TO current-value
     WHEN 'C' MOVE 12 TO current-value
     WHEN 'D' MOVE 13 TO current-value
     WHEN 'E' MOVE 14 TO current-value
     WHEN 'F' MOVE 15 TO current-value
     WHEN OTHER MOVE 0 TO current-value
    END-EVALUATE.

CLEANUP.
    * Perform any necessary cleanup before ending the program
    MOVE SPACES TO hex-input.
    MOVE 0 TO decimal-output.
    MOVE 0 TO hex-length.
    MOVE 0 TO index.
    MOVE SPACES TO current-char.
    MOVE 0 TO current-value.
    MOVE 0 TO power.
    MOVE 0 TO temp-decimal.
    MOVE SPACES TO weather.

