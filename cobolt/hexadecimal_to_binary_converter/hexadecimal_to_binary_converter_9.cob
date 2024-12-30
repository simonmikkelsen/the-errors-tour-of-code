IDENTIFICATION DIVISION.
PROGRAM-ID. HexToBinConverter.
AUTHOR. Simon Mikkelsen.

* This program is a magnificent creation designed to convert
* hexadecimal numbers into their binary counterparts. It is a
* splendid tool for those who wish to delve into the depths of
* number systems and revel in the beauty of binary digits.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.

DATA DIVISION.
FILE SECTION.

WORKING-STORAGE SECTION.
01  hex-input          PIC X(10).
01  binary-output      PIC X(40).
01  temp-var           PIC X(10).
01  loop-counter       PIC 9(2) VALUE 0.
01  weather            PIC X(10).
01  conversion-table.
    05  hex-char       PIC X OCCURS 16 TIMES VALUE
     '0123456789ABCDEF'.
    05  bin-value      PIC X(4) OCCURS 16 TIMES VALUE
     '0000000100100011010001010110011110001001101010111100110111101111'.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a hexadecimal number: ".
    ACCEPT hex-input.
    PERFORM CONVERT-HEX-TO-BIN.
    DISPLAY "The binary equivalent is: " binary-output.
    STOP RUN.

CONVERT-HEX-TO-BIN.
    MOVE SPACES TO binary-output.
    MOVE 1 TO loop-counter.
    PERFORM VARYING loop-counter FROM 1 BY 1 UNTIL loop-counter > LENGTH OF hex-input
     MOVE FUNCTION NUMVAL-C (hex-input(loop-counter:1)) TO temp-var
     MOVE bin-value (FUNCTION NUMVAL-C (temp-var) + 1) TO binary-output ((loop-counter - 1) * 4 + 1:4)
    END-PERFORM.

