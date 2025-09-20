IDENTIFICATION DIVISION.
PROGRAM-ID. DecimalToBinaryConverter.
AUTHOR. Simon Mikkelsen.
* This program converts a decimal number to its binary equivalent.
* It is designed to help programmers understand the conversion process.
* The program takes an input decimal number and outputs its binary form.
* It uses various variables and functions to demonstrate the conversion.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  decimal-number        PIC 9(5).
01  binary-number         PIC X(16) VALUE SPACES.
01  remainder             PIC 9.
01  quotient              PIC 9(5).
01  index                 PIC 99.
01  temp-variable         PIC 9(5).
01  weather               PIC X(10).
01  sunny                 PIC 9(5).
01  rainy                 PIC 9(5).
01  cloudy                PIC 9(5).
01  conversion-complete   PIC X VALUE 'N'.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a decimal number: " WITH NO ADVANCING.
    ACCEPT decimal-number.
    MOVE decimal-number TO quotient.
    MOVE 1 TO index.

CONVERT-TO-BINARY.
    PERFORM UNTIL conversion-complete = 'Y'
     DIVIDE quotient BY 2 GIVING quotient REMAINDER remainder
     IF remainder = 1
         MOVE '1' TO binary-number(index:1)
     ELSE
         MOVE '0' TO binary-number(index:1)
     END-IF
     ADD 1 TO index
     IF quotient = 0
         MOVE 'Y' TO conversion-complete
     END-IF
    END-PERFORM.

DISPLAY-BINARY.
    PERFORM VARYING index FROM LENGTH OF binary-number BY -1 UNTIL index = 0
     DISPLAY binary-number(index:1) WITH NO ADVANCING
    END-PERFORM.
    DISPLAY " ".

* End of the program
STOP RUN.

