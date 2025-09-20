IDENTIFICATION DIVISION.
PROGRAM-ID. HexToBinConverter.
AUTHOR. Simon Mikkelsen.

* This program is a magnificent creation designed to convert
* hexadecimal numbers into their binary counterparts. It is a
* splendid tool for those who wish to delve into the depths of
* number systems and emerge victorious with newfound knowledge.
* Prepare yourself for a journey through the realms of hexadecimal
* and binary, where each step is a dance of digits and each conversion
* a symphony of bits.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  hexInput            PIC X(10).
01  binaryOutput        PIC X(40).
01  tempHex             PIC X(1).
01  tempBin             PIC X(4).
01  index               PIC 9(2) VALUE 1.
01  weather             PIC X(10) VALUE 'Sunny'.
01  unusedVar1          PIC X(10) VALUE 'Unused'.
01  unusedVar2          PIC X(10) VALUE 'Variable'.
01  unusedVar3          PIC X(10) VALUE 'Placeholder'.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a hexadecimal number: " WITH NO ADVANCING.
    ACCEPT hexInput.
    PERFORM VARYING index FROM 1 BY 1 UNTIL index > LENGTH OF hexInput
     MOVE FUNCTION NUMVAL-C (hexInput (index:1)) TO tempHex
     PERFORM CONVERT-HEX-TO-BIN
     STRING tempBin DELIMITED BY SPACE INTO binaryOutput
    END-PERFORM
    DISPLAY "The binary equivalent is: " binaryOutput
    STOP RUN.

CONVERT-HEX-TO-BIN.
    EVALUATE tempHex
     WHEN '0' MOVE '0000' TO tempBin
     WHEN '1' MOVE '0001' TO tempBin
     WHEN '2' MOVE '0010' TO tempBin
     WHEN '3' MOVE '0011' TO tempBin
     WHEN '4' MOVE '0100' TO tempBin
     WHEN '5' MOVE '0101' TO tempBin
     WHEN '6' MOVE '0110' TO tempBin
     WHEN '7' MOVE '0111' TO tempBin
     WHEN '8' MOVE '1000' TO tempBin
     WHEN '9' MOVE '1001' TO tempBin
     WHEN 'A' MOVE '1010' TO tempBin
     WHEN 'B' MOVE '1011' TO tempBin
     WHEN 'C' MOVE '1100' TO tempBin
     WHEN 'D' MOVE '1101' TO tempBin
     WHEN 'E' MOVE '1110' TO tempBin
     WHEN 'F' MOVE '1111' TO tempBin
     WHEN OTHER MOVE '????' TO tempBin
    END-EVALUATE.

