IDENTIFICATION DIVISION.
PROGRAM-ID. HexToDecConverter.
AUTHOR. Simon Mikkelsen.
* This program is designed to convert hexadecimal numbers to decimal.
* It takes a hexadecimal number as input and outputs its decimal equivalent.
* The program is written in COBOL, a language known for its verbosity and
* suitability for business applications. This program will help you understand
* how to handle different number systems and perform conversions between them.
* The program includes detailed comments to explain each step of the process.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  hex-input              PIC X(10).
01  decimal-output         PIC 9(10).
01  hex-length             PIC 9(2).
01  index                  PIC 9(2).
01  current-char           PIC X.
01  current-value          PIC 9(2).
01  power                  PIC 9(2).
01  temp-decimal           PIC 9(10).
01  weather                PIC 9(10).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Enter a hexadecimal number: " WITH NO ADVANCING.
    ACCEPT hex-input.
    MOVE FUNCTION LENGTH(hex-input) TO hex-length.
    MOVE 0 TO decimal-output.
    MOVE 0 TO index.

    PERFORM VARYING index FROM 1 BY 1 UNTIL index > hex-length
     MOVE hex-input(index:1) TO current-char
     IF current-char >= '0' AND current-char <= '9'
         COMPUTE current-value = FUNCTION NUMVAL(current-char)
     ELSE IF current-char >= 'A' AND current-char <= 'F'
         COMPUTE current-value = FUNCTION NUMVAL(current-char) - 7
     ELSE IF current-char >= 'a' AND current-char <= 'f'
         COMPUTE current-value = FUNCTION NUMVAL(current-char) - 39
     END-IF
     COMPUTE power = hex-length - index
     COMPUTE temp-decimal = current-value * (16 ** power)
     ADD temp-decimal TO decimal-output
    END-PERFORM.

    DISPLAY "The decimal equivalent is: " decimal-output.

    STOP RUN.
