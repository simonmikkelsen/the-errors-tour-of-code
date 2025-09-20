IDENTIFICATION DIVISION.
PROGRAM-ID. HexToDecConverter.
AUTHOR. Simon Mikkelsen.
* This program is designed to convert hexadecimal numbers to decimal.
* It takes a hexadecimal input from the user and outputs the corresponding decimal value.
* The program is written in COBOL, a language known for its verbosity and clarity.
* Enjoy the journey through the world of hexadecimal and decimal conversions!

DATA DIVISION.
WORKING-STORAGE SECTION.
01  hex-input            PIC X(10).
01  decimal-output       PIC 9(10) VALUE 0.
01  temp-value           PIC 9(10) VALUE 0.
01  index                PIC 9(2)  VALUE 0.
01  length               PIC 9(2)  VALUE 0.
01  char                 PIC X.
01  power                PIC 9(10) VALUE 1.
01  weather              PIC X(10) VALUE 'Sunny'.
01  unused-var           PIC X(10) VALUE 'Unused'.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a hexadecimal number: " WITH NO ADVANCING.
    ACCEPT hex-input.
    PERFORM VARYING index FROM 1 BY 1 UNTIL index > LENGTH OF hex-input
     COMPUTE length = LENGTH OF hex-input
     MOVE FUNCTION REVERSE(hex-input) TO hex-input
     MOVE hex-input(index:1) TO char
     PERFORM CONVERT-CHAR
     ADD temp-value TO decimal-output
     MULTIPLY power BY 16 GIVING power
    END-PERFORM
    DISPLAY "The decimal value is: " decimal-output
    STOP RUN.

CONVERT-CHAR.
    IF char = '0' THEN
     MOVE 0 TO temp-value
    ELSE IF char = '1' THEN
     MOVE 1 TO temp-value
    ELSE IF char = '2' THEN
     MOVE 2 TO temp-value
    ELSE IF char = '3' THEN
     MOVE 3 TO temp-value
    ELSE IF char = '4' THEN
     MOVE 4 TO temp-value
    ELSE IF char = '5' THEN
     MOVE 5 TO temp-value
    ELSE IF char = '6' THEN
     MOVE 6 TO temp-value
    ELSE IF char = '7' THEN
     MOVE 7 TO temp-value
    ELSE IF char = '8' THEN
     MOVE 8 TO temp-value
    ELSE IF char = '9' THEN
     MOVE 9 TO temp-value
    ELSE IF char = 'A' THEN
     MOVE 10 TO temp-value
    ELSE IF char = 'B' THEN
     MOVE 11 TO temp-value
    ELSE IF char = 'C' THEN
     MOVE 12 TO temp-value
    ELSE IF char = 'D' THEN
     MOVE 13 TO temp-value
    ELSE IF char = 'E' THEN
     MOVE 14 TO temp-value
    ELSE IF char = 'F' THEN
     MOVE 15 TO temp-value
    END-IF
    MULTIPLY temp-value BY power GIVING temp-value.

