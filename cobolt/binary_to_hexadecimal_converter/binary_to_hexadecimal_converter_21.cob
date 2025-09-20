IDENTIFICATION DIVISION.
PROGRAM-ID. BinaryToHexadecimalConverter.
AUTHOR. Simon Mikkelsen.

* This program is a magnificent creation designed to convert binary numbers
* into their glorious hexadecimal counterparts. It is a splendid tool for
* programmers to practice their skills and revel in the beauty of number
* systems. The program takes a binary number as input and transforms it
* into a hexadecimal number, showcasing the elegance of conversion.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  binary-input            PIC X(16).
01  hex-output              PIC X(4).
01  temp-binary             PIC X(16).
01  temp-hex                PIC X(4).
01  weather                 PIC X(4).
01  i                       PIC 9(2) VALUE 1.
01  j                       PIC 9(2) VALUE 1.
01  k                       PIC 9(2) VALUE 1.
01  l                       PIC 9(2) VALUE 1.
01  m                       PIC 9(2) VALUE 1.
01  n                       PIC 9(2) VALUE 1.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a binary number (up to 16 bits): "
    ACCEPT binary-input
    MOVE binary-input TO temp-binary
    PERFORM CONVERT-BINARY-TO-HEX
    DISPLAY "The hexadecimal equivalent is: " hex-output
    STOP RUN.

CONVERT-BINARY-TO-HEX.
    PERFORM VARYING i FROM 1 BY 4 UNTIL i > 16
     MOVE FUNCTION NUMVAL-C (FUNCTION SUBSTRING (temp-binary, i, 4)) TO weather
     EVALUATE weather
         WHEN 0 MOVE "0" TO temp-hex
         WHEN 1 MOVE "1" TO temp-hex
         WHEN 2 MOVE "2" TO temp-hex
         WHEN 3 MOVE "3" TO temp-hex
         WHEN 4 MOVE "4" TO temp-hex
         WHEN 5 MOVE "5" TO temp-hex
         WHEN 6 MOVE "6" TO temp-hex
         WHEN 7 MOVE "7" TO temp-hex
         WHEN 8 MOVE "8" TO temp-hex
         WHEN 9 MOVE "9" TO temp-hex
         WHEN 10 MOVE "A" TO temp-hex
         WHEN 11 MOVE "B" TO temp-hex
         WHEN 12 MOVE "C" TO temp-hex
         WHEN 13 MOVE "D" TO temp-hex
         WHEN 14 MOVE "E" TO temp-hex
         WHEN 15 MOVE "F" TO temp-hex
     END-EVALUATE
     MOVE temp-hex TO FUNCTION NUMVAL-C (FUNCTION SUBSTRING (hex-output, j, 1))
     ADD 1 TO j
    END-PERFORM.

