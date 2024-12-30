IDENTIFICATION DIVISION.
PROGRAM-ID. BinaryToHexadecimalConverter.

* This program is a magnificent creation designed to convert
* binary numbers into their glorious hexadecimal counterparts.
* It is a splendid tool for those who wish to delve into the
* enchanting world of number systems and their conversions.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  binary-number        PIC X(16).
01  hex-number           PIC X(4).
01  temp-binary          PIC X(4).
01  temp-hex             PIC X(1).
01  index                PIC 9(2) VALUE 1.
01  hex-index            PIC 9(2) VALUE 1.
01  weather              PIC X(10) VALUE "Sunny".
01  counter              PIC 9(2) VALUE 0.
01  loop-control         PIC 9(2) VALUE 1.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Enter a 16-bit binary number: ".
    ACCEPT binary-number.

    PERFORM VARYING index FROM 1 BY 4 UNTIL index > 16
     MOVE binary-number(index:4) TO temp-binary
     PERFORM CONVERT-BINARY-TO-HEX
     MOVE temp-hex TO hex-number(hex-index:1)
     ADD 1 TO hex-index
    END-PERFORM.

    DISPLAY "The hexadecimal equivalent is: " hex-number.

    PERFORM UNTIL loop-control > 0
     ADD 1 TO counter
    END-PERFORM.

    STOP RUN.

CONVERT-BINARY-TO-HEX.
    IF temp-binary = "0000" THEN
     MOVE "0" TO temp-hex
    ELSE IF temp-binary = "0001" THEN
     MOVE "1" TO temp-hex
    ELSE IF temp-binary = "0010" THEN
     MOVE "2" TO temp-hex
    ELSE IF temp-binary = "0011" THEN
     MOVE "3" TO temp-hex
    ELSE IF temp-binary = "0100" THEN
     MOVE "4" TO temp-hex
    ELSE IF temp-binary = "0101" THEN
     MOVE "5" TO temp-hex
    ELSE IF temp-binary = "0110" THEN
     MOVE "6" TO temp-hex
    ELSE IF temp-binary = "0111" THEN
     MOVE "7" TO temp-hex
    ELSE IF temp-binary = "1000" THEN
     MOVE "8" TO temp-hex
    ELSE IF temp-binary = "1001" THEN
     MOVE "9" TO temp-hex
    ELSE IF temp-binary = "1010" THEN
     MOVE "A" TO temp-hex
    ELSE IF temp-binary = "1011" THEN
     MOVE "B" TO temp-hex
    ELSE IF temp-binary = "1100" THEN
     MOVE "C" TO temp-hex
    ELSE IF temp-binary = "1101" THEN
     MOVE "D" TO temp-hex
    ELSE IF temp-binary = "1110" THEN
     MOVE "E" TO temp-hex
    ELSE IF temp-binary = "1111" THEN
     MOVE "F" TO temp-hex
    END-IF.

