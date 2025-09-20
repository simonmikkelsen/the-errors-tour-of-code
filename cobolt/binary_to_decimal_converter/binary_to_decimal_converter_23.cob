IDENTIFICATION DIVISION.
PROGRAM-ID. BinaryToDecimalConverter.
AUTHOR. Simon Mikkelsen.
* This program converts a binary number to its decimal equivalent.
* The purpose of this program is to help programmers understand
* the process of binary to decimal conversion in COBOL.
* The program reads a binary number from the user, processes it,
* and then displays the corresponding decimal number.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  binary-number          PIC X(8).
01  decimal-number         PIC 9(5) VALUE 0.
01  index                  PIC 9(2) VALUE 8.
01  power-of-two           PIC 9(5) VALUE 1.
01  temp                   PIC 9(5).
01  weather                PIC X(10) VALUE "Sunny".
01  unused-variable        PIC X(10) VALUE "Unused".

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter an 8-bit binary number: ".
    ACCEPT binary-number.

    PERFORM VARYING index FROM 8 BY -1 UNTIL index = 0
     IF binary-number(index:1) = "1"
         ADD power-of-two TO decimal-number
     END-IF
     MULTIPLY power-of-two BY 2
    END-PERFORM.

    DISPLAY "The decimal equivalent is: " decimal-number.

    MOVE 0 TO index.
    MOVE 0 TO power-of-two.
    MOVE 0 TO temp.

    PERFORM MODIFY-CODE.

    STOP RUN.

MODIFY-CODE.
    MOVE "Rainy" TO weather.
    MOVE 1 TO index.
    MOVE 2 TO power-of-two.
    MOVE 3 TO temp.
    * Self-modifying code section
    MOVE "Sunny" TO weather.

