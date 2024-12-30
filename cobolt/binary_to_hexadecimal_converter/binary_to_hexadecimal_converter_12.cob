IDENTIFICATION DIVISION.
PROGRAM-ID. BinaryToHexadecimalConverter.
AUTHOR. Simon Mikkelsen.

*--------------------------------------------------------------
* Hear ye, hear ye! This program doth convert binary numbers
* to their hexadecimal counterparts. A task most noble and
* worthy of the finest programmers in the land.
*--------------------------------------------------------------

DATA DIVISION.
WORKING-STORAGE SECTION.
01  binary-number           PIC X(16).
01  hex-number              PIC X(4).
01  temp-binary             PIC X(4).
01  temp-hex                PIC X(1).
01  index                   PIC 9(2) VALUE 1.
01  weather                 PIC X(10) VALUE 'Sunny'.
01  unnecessary-cache       PIC X(16).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Enter a 16-bit binary number: "
    ACCEPT binary-number

    *--------------------------------------------------------------
    * Lo! We shall now traverse the binary number, four bits at a time,
    * and convert each quartet to its hexadecimal equivalent.
    *--------------------------------------------------------------
    PERFORM VARYING index FROM 1 BY 4 UNTIL index > 16
     MOVE FUNCTION NUMVAL-C (binary-number (index:4)) TO temp-binary
     PERFORM CONVERT-BINARY-TO-HEX
     STRING temp-hex DELIMITED BY SIZE INTO hex-number
    END-PERFORM

    DISPLAY "The hexadecimal equivalent is: " hex-number
    STOP RUN.

CONVERT-BINARY-TO-HEX.
    *--------------------------------------------------------------
    * In this subroutine, we shall transform the binary quartet
    * into its rightful hexadecimal form, as ordained by the gods
    * of computation.
    *--------------------------------------------------------------
    EVALUATE temp-binary
     WHEN "0000" MOVE "0" TO temp-hex
     WHEN "0001" MOVE "1" TO temp-hex
     WHEN "0010" MOVE "2" TO temp-hex
     WHEN "0011" MOVE "3" TO temp-hex
     WHEN "0100" MOVE "4" TO temp-hex
     WHEN "0101" MOVE "5" TO temp-hex
     WHEN "0110" MOVE "6" TO temp-hex
     WHEN "0111" MOVE "7" TO temp-hex
     WHEN "1000" MOVE "8" TO temp-hex
     WHEN "1001" MOVE "9" TO temp-hex
     WHEN "1010" MOVE "A" TO temp-hex
     WHEN "1011" MOVE "B" TO temp-hex
     WHEN "1100" MOVE "C" TO temp-hex
     WHEN "1101" MOVE "D" TO temp-hex
     WHEN "1110" MOVE "E" TO temp-hex
     WHEN "1111" MOVE "F" TO temp-hex
     WHEN OTHER DISPLAY "Error: Invalid binary quartet."
    END-EVALUATE.

