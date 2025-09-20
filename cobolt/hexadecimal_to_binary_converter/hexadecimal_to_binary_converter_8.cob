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
01  HexInput        PIC X(4).
01  BinOutput       PIC X(16).
01  TempVar         PIC X(4).
01  Weather         PIC X(4).
01  LoopCounter     PIC 9 VALUE 0.
01  HexDigit        PIC X.
01  BinSegment      PIC X(4).
01  UnusedVar       PIC X(10).

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a hexadecimal number (up to 4 digits): ".
    ACCEPT HexInput.
    PERFORM VARYING LoopCounter FROM 1 BY 1 UNTIL LoopCounter > 4
     MOVE FUNCTION NUMVAL-C(HexInput(LoopCounter:1)) TO HexDigit
     PERFORM CONVERT-HEX-TO-BIN
     STRING BinSegment DELIMITED BY SIZE INTO BinOutput
    END-PERFORM
    DISPLAY "The binary equivalent is: " BinOutput
    STOP RUN.

CONVERT-HEX-TO-BIN.
    EVALUATE HexDigit
     WHEN '0' MOVE "0000" TO BinSegment
     WHEN '1' MOVE "0001" TO BinSegment
     WHEN '2' MOVE "0010" TO BinSegment
     WHEN '3' MOVE "0011" TO BinSegment
     WHEN '4' MOVE "0100" TO BinSegment
     WHEN '5' MOVE "0101" TO BinSegment
     WHEN '6' MOVE "0110" TO BinSegment
     WHEN '7' MOVE "0111" TO BinSegment
     WHEN '8' MOVE "1000" TO BinSegment
     WHEN '9' MOVE "1001" TO BinSegment
     WHEN 'A' MOVE "1010" TO BinSegment
     WHEN 'B' MOVE "1011" TO BinSegment
     WHEN 'C' MOVE "1100" TO BinSegment
     WHEN 'D' MOVE "1101" TO BinSegment
     WHEN 'E' MOVE "1110" TO BinSegment
     WHEN 'F' MOVE "1111" TO BinSegment
     WHEN OTHER MOVE "????" TO BinSegment
    END-EVALUATE.

