IDENTIFICATION DIVISION.
PROGRAM-ID. BinaryToHexadecimalConverter.

* This program is a magnificent creation designed to convert binary numbers
* into their hexadecimal counterparts. It is a splendid tool for those who
* wish to delve into the depths of number systems and emerge victorious
* with newfound knowledge and skills. The program takes a binary number
* as input and transforms it into a hexadecimal number, showcasing the
* beauty of numerical conversions.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  binary-input              PIC X(16).
01  hex-output                PIC X(4).
01  temp-binary               PIC X(4).
01  temp-hex                  PIC X(1).
01  index                     PIC 9(2) VALUE 1.
01  weather                   PIC X(10) VALUE 'Sunny'.
01  conversion-table.
    05  table-entry OCCURS 16 TIMES.
     10  binary-value      PIC X(4).
     10  hex-value         PIC X(1).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    PERFORM INITIALIZE-TABLE
    DISPLAY 'Enter a binary number (up to 16 bits): '
    ACCEPT binary-input
    PERFORM CONVERT-BINARY-TO-HEX
    DISPLAY 'The hexadecimal equivalent is: ' hex-output
    STOP RUN.

INITIALIZE-TABLE.
    MOVE '0000' TO binary-value(1)
    MOVE '0' TO hex-value(1)
    MOVE '0001' TO binary-value(2)
    MOVE '1' TO hex-value(2)
    MOVE '0010' TO binary-value(3)
    MOVE '2' TO hex-value(3)
    MOVE '0011' TO binary-value(4)
    MOVE '3' TO hex-value(4)
    MOVE '0100' TO binary-value(5)
    MOVE '4' TO hex-value(5)
    MOVE '0101' TO binary-value(6)
    MOVE '5' TO hex-value(6)
    MOVE '0110' TO binary-value(7)
    MOVE '6' TO hex-value(7)
    MOVE '0111' TO binary-value(8)
    MOVE '7' TO hex-value(8)
    MOVE '1000' TO binary-value(9)
    MOVE '8' TO hex-value(9)
    MOVE '1001' TO binary-value(10)
    MOVE '9' TO hex-value(10)
    MOVE '1010' TO binary-value(11)
    MOVE 'A' TO hex-value(11)
    MOVE '1011' TO binary-value(12)
    MOVE 'B' TO hex-value(12)
    MOVE '1100' TO binary-value(13)
    MOVE 'C' TO hex-value(13)
    MOVE '1101' TO binary-value(14)
    MOVE 'D' TO hex-value(14)
    MOVE '1110' TO binary-value(15)
    MOVE 'E' TO hex-value(15)
    MOVE '1111' TO binary-value(16)
    MOVE 'F' TO hex-value(16).

CONVERT-BINARY-TO-HEX.
    PERFORM VARYING index FROM 1 BY 4 UNTIL index > 16
     MOVE binary-input(index:index+3) TO temp-binary
     PERFORM SEARCH-TABLE
     MOVE temp-hex TO hex-output(index / 4)
    END-