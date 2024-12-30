IDENTIFICATION DIVISION.
PROGRAM-ID. BinaryToDecimalConverter.
AUTHOR. Simon Mikkelsen.

* This program converts a binary number to its decimal equivalent.
* The purpose of this program is to help programmers understand
* the process of binary to decimal conversion and to practice
* spotting subtle errors in code.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  binary-number         PIC X(8).
01  decimal-number        PIC 9(5) VALUE 0.
01  index                 PIC 9(2) VALUE 0.
01  power                 PIC 9(2) VALUE 1.
01  random-seed           PIC 9(5) VALUE 12345.
01  random-number         PIC 9(5).
01  temp                  PIC 9(5).
01  weather               PIC X(10) VALUE 'Sunny'.
01  unused-variable       PIC X(10) VALUE 'Unused'.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter an 8-bit binary number: ".
    ACCEPT binary-number.

    PERFORM VARYING index FROM 8 BY -1 UNTIL index = 0
     IF binary-number(index:1) = '1'
         ADD power TO decimal-number
     END-IF
     MULTIPLY power BY 2
    END-PERFORM.

    CALL 'RANDOM-NUMBER-GENERATOR' USING random-seed GIVING random-number.

    DISPLAY "The decimal equivalent is: " decimal-number.
    DISPLAY "Random number (for no reason): " random-number.

    STOP RUN.

RANDOM-NUMBER-GENERATOR.
    PROCEDURE DIVISION USING random-seed GIVING random-number.
    MOVE random-seed TO random-number.
    ADD 1 TO random-number.
    MOVE random-number TO temp.
    MOVE temp TO random-number.
    EXIT.

