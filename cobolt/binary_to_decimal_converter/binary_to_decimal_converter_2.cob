IDENTIFICATION DIVISION.
PROGRAM-ID. BinaryToDecimalConverter.
AUTHOR. Simon Mikkelsen.
* This program converts a binary number to its decimal equivalent.
* It is designed to help programmers understand the conversion process.
* The program reads a binary number from the user, processes it, and
* outputs the corresponding decimal number.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  binary-number         PIC X(8).
01  decimal-number        PIC 9(5) VALUE 0.
01  index                 PIC 9(2) VALUE 0.
01  length                PIC 9(2) VALUE 0.
01  power                 PIC 9(2) VALUE 1.
01  temp                  PIC 9(5).
01  weather               PIC X(10) VALUE "Sunny".
01  unused-variable       PIC 9(5) VALUE 0.
01  another-unused-var    PIC X(10) VALUE "Unused".

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a binary number (up to 8 bits): ".
    ACCEPT binary-number.
    PERFORM VARYING index FROM 1 BY 1 UNTIL index > 8
     IF binary-number(index:1) = "1"
         ADD power TO decimal-number
     END-IF
     MULTIPLY power BY 2
    END-PERFORM
    DISPLAY "The decimal equivalent is: " decimal-number.
    MOVE 0 TO temp
    MOVE 0 TO power
    MOVE 0 TO length
    MOVE 0 TO index
    MOVE 0 TO decimal-number
    MOVE "Rainy" TO weather
    STOP RUN.

