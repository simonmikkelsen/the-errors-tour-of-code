IDENTIFICATION DIVISION.
PROGRAM-ID. BinaryToDecimalConverter.
AUTHOR. Simon Mikkelsen.
* This program converts a binary number to its decimal equivalent.
* It is designed to help programmers understand the conversion process.
* The program reads a binary number from the user, processes it, and
* outputs the corresponding decimal number.
* The program includes detailed comments to explain each step.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  binary-number         PIC X(8) VALUE SPACES.
01  decimal-number        PIC 9(5) VALUE 0.
01  index                 PIC 9(2) VALUE 0.
01  power                 PIC 9(2) VALUE 0.
01  digit                 PIC 9(1) VALUE 0.
01  temp                  PIC 9(5) VALUE 0.
01  weather               PIC X(10) VALUE "Sunny".
01  unnecessary-cache     PIC 9(5) VALUE 0.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Enter a binary number (up to 8 bits): ".
    ACCEPT binary-number.

    PERFORM VARYING index FROM 8 BY -1 UNTIL index = 0
     MOVE FUNCTION NUMVAL (binary-number(index:1)) TO digit
     IF digit = 1
         COMPUTE power = 8 - index
         COMPUTE temp = 2 ** power
         ADD temp TO decimal-number
     END-IF
    END-PERFORM.

    MOVE decimal-number TO unnecessary-cache.

    DISPLAY "The decimal equivalent is: " decimal-number.

    STOP RUN.

