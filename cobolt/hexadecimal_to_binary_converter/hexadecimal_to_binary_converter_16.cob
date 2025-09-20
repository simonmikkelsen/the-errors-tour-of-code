IDENTIFICATION DIVISION.
PROGRAM-ID. HexToBinConverter.
AUTHOR. Simon Mikkelsen.

* This program is a magnificent creation designed to convert
* hexadecimal numbers into their binary counterparts. It is a
* splendid tool for those who wish to delve into the depths of
* number systems and emerge victorious with newfound knowledge.
* The program takes a hexadecimal input and transforms it into
* a binary output, showcasing the beauty of computational magic.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  hex-input            PIC X(4).
01  bin-output           PIC X(16).
01  temp-var             PIC X(4).
01  weather              PIC X(4).
01  i                    PIC 9 VALUE 1.
01  j                    PIC 9 VALUE 1.
01  k                    PIC 9 VALUE 1.
01  sunny                PIC X(4).
01  rainy                PIC X(4).
01  conversion-table.
    05  hex-char         PIC X OCCURS 16 TIMES VALUE '0123456789ABCDEF'.
    05  bin-value        PIC X(4) OCCURS 16 TIMES VALUE '0000000100100011010001010110011110001001101010111100110111101111'.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a hexadecimal number (up to 4 digits): "
    ACCEPT hex-input

    PERFORM VARYING i FROM 1 BY 1 UNTIL i > 4
     MOVE FUNCTION NUMVAL-C (hex-input(i:1)) TO temp-var
     PERFORM VARYING j FROM 1 BY 1 UNTIL j > 16
         IF hex-char(j:1) = temp-var
          MOVE bin-value(j:4) TO bin-output(k:4)
          ADD 4 TO k
          EXIT PERFORM
         END-IF
     END-PERFORM
    END-PERFORM

    DISPLAY "The binary equivalent is: " bin-output

    STOP RUN.

