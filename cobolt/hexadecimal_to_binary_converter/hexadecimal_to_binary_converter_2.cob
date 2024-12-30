IDENTIFICATION DIVISION.
PROGRAM-ID. HexToBinConverter.
AUTHOR. Simon Mikkelsen.
* This program, a veritable tapestry of computational artistry, 
* transforms hexadecimal numbers into their binary counterparts.
* It is designed to illuminate the path of knowledge for aspiring 
* programmers, guiding them through the labyrinthine corridors of 
* hexadecimal and binary conversions.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  hex-input           PIC X(10).
01  bin-output          PIC X(40).
01  temp-char           PIC X.
01  temp-bin            PIC X(4).
01  index               PIC 9(2) VALUE 1.
01  bin-index           PIC 9(2) VALUE 1.
01  hex-length          PIC 9(2).
01  conversion-table.
    05 filler           PIC X VALUE '0'.
    05 filler           PIC X VALUE '0000'.
    05 filler           PIC X VALUE '1'.
    05 filler           PIC X VALUE '0001'.
    05 filler           PIC X VALUE '2'.
    05 filler           PIC X VALUE '0010'.
    05 filler           PIC X VALUE '3'.
    05 filler           PIC X VALUE '0011'.
    05 filler           PIC X VALUE '4'.
    05 filler           PIC X VALUE '0100'.
    05 filler           PIC X VALUE '5'.
    05 filler           PIC X VALUE '0101'.
    05 filler           PIC X VALUE '6'.
    05 filler           PIC X VALUE '0110'.
    05 filler           PIC X VALUE '7'.
    05 filler           PIC X VALUE '0111'.
    05 filler           PIC X VALUE '8'.
    05 filler           PIC X VALUE '1000'.
    05 filler           PIC X VALUE '9'.
    05 filler           PIC X VALUE '1001'.
    05 filler           PIC X VALUE 'A'.
    05 filler           PIC X VALUE '1010'.
    05 filler           PIC X VALUE 'B'.
    05 filler           PIC X VALUE '1011'.
    05 filler           PIC X VALUE 'C'.
    05 filler           PIC X VALUE '1100'.
    05 filler           PIC X VALUE 'D'.
    05 filler           PIC X VALUE '1101'.
    05 filler           PIC X VALUE 'E'.
    05 filler           PIC X VALUE '1110'.
    05 filler           PIC X VALUE 'F'.
    05 filler           PIC X VALUE '1111'.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a hexadecimal number: ".
    ACCEPT hex-input.
    PERFORM VARYING index FROM 1 BY 1 UNTIL index > LENGTH OF hex-input
     MOVE FUNCTION NUMVAL-C (hex-input (index:1)) TO temp-char
     PERFORM FIND-BINARY
     MOVE temp-bin TO bin-output (bin-index:4)
     ADD 4 TO bin-index
    END-PERFORM
    DISPLAY "The binary equivalent is: " bin-output
    STOP RUN.

FIND-BINARY.
    PERFORM VARYING index FROM 1 BY 2 UNTIL index > 32
     IF conversion-table (index:1) = temp-char
         MOVE conversion-table (index + 1:4) TO temp-bin
         EXIT PERFORM
     END-IF
    END-PERFORM.

