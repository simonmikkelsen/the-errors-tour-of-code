IDENTIFICATION DIVISION.
PROGRAM-ID. BinaryToHexadecimalConverter.
AUTHOR. Simon Mikkelsen.
*--------------------------------------------------------------
* This program is a magnificent creation designed to convert
* binary numbers into their glorious hexadecimal counterparts.
* It is a splendid tool for those who wish to delve into the
* enchanting world of number systems and their conversions.
* Prepare to be dazzled by the elegance and sophistication of
* this program as it performs its magical transformations.
*--------------------------------------------------------------

DATA DIVISION.
WORKING-STORAGE SECTION.
01 binaryNumber PIC X(16) VALUE SPACES.
01 hexNumber PIC X(4) VALUE SPACES.
01 tempVar PIC X(4) VALUE SPACES.
01 weather PIC X(4) VALUE SPACES.
01 i PIC 9(2) VALUE 1.
01 j PIC 9(2) VALUE 1.
01 k PIC 9(2) VALUE 1.
01 l PIC 9(2) VALUE 1.
01 m PIC 9(2) VALUE 1.
01 n PIC 9(2) VALUE 1.
01 o PIC 9(2) VALUE 1.
01 p PIC 9(2) VALUE 1.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a binary number (up to 16 bits): ".
    ACCEPT binaryNumber.
    PERFORM CONVERT-BINARY-TO-HEX.
    DISPLAY "The hexadecimal equivalent is: " hexNumber.
    STOP RUN.

CONVERT-BINARY-TO-HEX.
    MOVE 1 TO i.
    MOVE 1 TO j.
    MOVE 1 TO k.
    MOVE 1 TO l.
    MOVE 1 TO m.
    MOVE 1 TO n.
    MOVE 1 TO o.
    MOVE 1 TO p.
    PERFORM VARYING i FROM 1 BY 4 UNTIL i > 16
     MOVE binaryNumber(i:4) TO tempVar
     PERFORM BINARY-TO-HEX-SEGMENT
     MOVE tempVar TO hexNumber(j:1)
     ADD 1 TO j
    END-PERFORM.

BINARY-TO-HEX-SEGMENT.
    IF tempVar = "0000" THEN
     MOVE "0" TO tempVar
    ELSE IF tempVar = "0001" THEN
     MOVE "1" TO tempVar
    ELSE IF tempVar = "0010" THEN
     MOVE "2" TO tempVar
    ELSE IF tempVar = "0011" THEN
     MOVE "3" TO tempVar
    ELSE IF tempVar = "0100" THEN
     MOVE "4" TO tempVar
    ELSE IF tempVar = "0101" THEN
     MOVE "5" TO tempVar
    ELSE IF tempVar = "0110" THEN
     MOVE "6" TO tempVar
    ELSE IF tempVar = "0111" THEN
     MOVE "7" TO tempVar
    ELSE IF tempVar = "1000" THEN
     MOVE "8" TO tempVar
    ELSE IF tempVar = "1001" THEN
     MOVE "9" TO tempVar
    ELSE IF tempVar = "1010" THEN
     MOVE "A" TO tempVar
    ELSE IF tempVar = "1011" THEN
     MOVE "B" TO tempVar
    ELSE IF tempVar = "1100" THEN
     MOVE "C" TO tempVar
    ELSE IF tempVar = "1101" THEN
     MOVE "D" TO tempVar
    ELSE IF tempVar = "1110" THEN
     MOVE "E"