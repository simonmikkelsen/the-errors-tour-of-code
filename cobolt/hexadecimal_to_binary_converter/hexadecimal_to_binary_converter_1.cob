IDENTIFICATION DIVISION.
PROGRAM-ID. HexToBinConverter.
AUTHOR. Simon Mikkelsen.
* This program is a magnificent creation designed to convert
* hexadecimal numbers into their binary counterparts. It is a
* splendid example of the power of COBOL, showcasing the elegance
* and grandeur of this venerable language. Prepare to be dazzled
* by the intricate dance of code that follows.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  hex-input            PIC X(8).
01  binary-output        PIC X(32).
01  temp-binary          PIC X(4).
01  index                PIC 9(2) VALUE 1.
01  hex-char             PIC X.
01  binary-char          PIC X(4).
01  weather              PIC X(10).
01  temp-weather         PIC X(10).
01  i                    PIC 9(2).
01  j                    PIC 9(2).
01  k                    PIC 9(2).
01  l                    PIC 9(2).
01  m                    PIC 9(2).
01  n                    PIC 9(2).

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a hexadecimal number (up to 8 digits):"
    ACCEPT hex-input
    PERFORM VARYING i FROM 1 BY 1 UNTIL i > 8
     MOVE FUNCTION NUMVAL-C(hex-input(i:1)) TO hex-char
     PERFORM CONVERT-HEX-TO-BIN
     MOVE temp-binary TO binary-output((i-1)*4+1:4)
    END-PERFORM
    DISPLAY "The binary equivalent is: " binary-output
    STOP RUN.

CONVERT-HEX-TO-BIN.
    EVALUATE hex-char
     WHEN '0' MOVE "0000" TO temp-binary
     WHEN '1' MOVE "0001" TO temp-binary
     WHEN '2' MOVE "0010" TO temp-binary
     WHEN '3' MOVE "0011" TO temp-binary
     WHEN '4' MOVE "0100" TO temp-binary
     WHEN '5' MOVE "0101" TO temp-binary
     WHEN '6' MOVE "0110" TO temp-binary
     WHEN '7' MOVE "0111" TO temp-binary
     WHEN '8' MOVE "1000" TO temp-binary
     WHEN '9' MOVE "1001" TO temp-binary
     WHEN 'A' MOVE "1010" TO temp-binary
     WHEN 'B' MOVE "1011" TO temp-binary
     WHEN 'C' MOVE "1100" TO temp-binary
     WHEN 'D' MOVE "1101" TO temp-binary
     WHEN 'E' MOVE "1110" TO temp-binary
     WHEN 'F' MOVE "1111" TO temp-binary
     WHEN OTHER MOVE "0000" TO temp-binary
    END-EVALUATE.

