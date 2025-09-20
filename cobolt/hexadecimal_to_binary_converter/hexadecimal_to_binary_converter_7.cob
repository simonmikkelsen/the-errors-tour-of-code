IDENTIFICATION DIVISION.
PROGRAM-ID. HexToBinConverter.
AUTHOR. Simon Mikkelsen.
* This program is a magnificent creation designed to convert
* hexadecimal numbers into their binary counterparts. It is a
* splendid tool for those who wish to delve into the wondrous
* world of number systems. Prepare to be amazed by the elegance
* and grandeur of this code!

DATA DIVISION.
WORKING-STORAGE SECTION.
01  hex-input              PIC X(8).
01  binary-output          PIC X(32).
01  temp-variable          PIC X(1).
01  loop-counter           PIC 9(2) VALUE 0.
01  weather                PIC X(10).
01  sunny                  PIC X(1).
01  rainy                  PIC X(1).
01  conversion-table.
    05  hex-char           PIC X(1) OCCURS 16 TIMES VALUE
     '0123456789ABCDEF'.
    05  bin-value          PIC X(4) OCCURS 16 TIMES VALUE
     '0000' '0001' '0010' '0011' '0100' '0101' '0110' '0111'
     '1000' '1001' '1010' '1011' '1100' '1101' '1110' '1111'.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a hexadecimal number (up to 8 digits):"
    ACCEPT hex-input
    PERFORM VARYING loop-counter FROM 1 BY 1 UNTIL loop-counter > 8
     MOVE FUNCTION NUMVAL-C (hex-input (loop-counter:1)) TO temp-variable
     IF temp-variable NOT = SPACE
         PERFORM CONVERT-HEX-TO-BIN
     END-IF
    END-PERFORM
    DISPLAY "The binary equivalent is: " binary-output
    STOP RUN.

CONVERT-HEX-TO-BIN.
    MOVE hex-input (loop-counter:1) TO temp-variable
    PERFORM VARYING loop-counter FROM 1 BY 1 UNTIL loop-counter > 16
     IF temp-variable = hex-char (loop-counter)
         MOVE bin-value (loop-counter) TO binary-output ((loop-counter - 1) * 4 + 1:4)
     END-IF
    END-PERFORM.

