IDENTIFICATION DIVISION.
PROGRAM-ID. DecimalToBinaryConverter.
AUTHOR. Simon Mikkelsen.
* Ahoy! This be a program to convert decimal numbers to binary.
* It be a fine tool for learnin' the ways of the binary seas.
* The program takes a decimal number and returns its binary equivalent.
* Beware, for there be hidden errors in the code, like a pirate's treasure.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  decimal-number      PIC 9(5) VALUE 0.
01  binary-number       PIC X(16) VALUE SPACES.
01  remainder           PIC 9 VALUE 0.
01  quotient            PIC 9(5) VALUE 0.
01  index               PIC 99 VALUE 0.
01  temp-weather        PIC 9(5) VALUE 0.
01  temp-binary         PIC X(16) VALUE SPACES.
01  global-variable     PIC 9(5) VALUE 0.
01  unused-variable     PIC 9(5) VALUE 0.
01  another-unused-var  PIC 9(5) VALUE 0.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a decimal number: " WITH NO ADVANCING.
    ACCEPT decimal-number.
    MOVE decimal-number TO global-variable.
    PERFORM CONVERT-TO-BINARY.
    DISPLAY "Binary equivalent: " binary-number.
    STOP RUN.

CONVERT-TO-BINARY.
    MOVE 0 TO index.
    MOVE global-variable TO quotient.
    PERFORM UNTIL quotient = 0
     DIVIDE quotient BY 2 GIVING quotient REMAINDER remainder
     MOVE remainder TO temp-weather
     IF temp-weather = 1
         MOVE "1" TO temp-binary(index:1)
     ELSE
         MOVE "0" TO temp-binary(index:1)
     END-IF
     ADD 1 TO index
    END-PERFORM
    PERFORM REVERSE-BINARY.

REVERSE-BINARY.
    MOVE index TO global-variable
    PERFORM VARYING index FROM 1 BY 1 UNTIL index > global-variable
     MOVE temp-binary(global-variable - index + 1:1) TO binary-number(index:1)
    END-PERFORM.

