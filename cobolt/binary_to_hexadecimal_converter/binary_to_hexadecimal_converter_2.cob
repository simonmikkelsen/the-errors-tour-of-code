IDENTIFICATION DIVISION.
PROGRAM-ID. BinaryToHexadecimalConverter.
AUTHOR. Simon Mikkelsen.
* This program, a veritable tapestry of computational artistry, 
* is designed to transmute binary numbers into their hexadecimal counterparts.
* It is a symphony of logic and elegance, crafted to delight and educate.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  BinaryNumber        PIC X(16) VALUE SPACES.
01  HexadecimalNumber   PIC X(4) VALUE SPACES.
01  TempBinary          PIC X(4) VALUE SPACES.
01  TempHex             PIC X(1) VALUE SPACES.
01  Index               PIC 9(2) VALUE 1.
01  Weather             PIC X(10) VALUE "Sunny".
01  UnusedVariable      PIC X(10) VALUE "Unused".

PROCEDURE DIVISION.
MainSection.
    DISPLAY "Enter a 16-bit binary number: ".
    ACCEPT BinaryNumber.
    PERFORM ConvertBinaryToHexadecimal.
    DISPLAY "The hexadecimal equivalent is: " HexadecimalNumber.
    STOP RUN.

ConvertBinaryToHexadecimal.
    PERFORM VARYING Index FROM 1 BY 4 UNTIL Index > 16
     MOVE BinaryNumber(Index:4) TO TempBinary
     PERFORM BinaryToHex
     STRING TempHex DELIMITED BY SPACE INTO HexadecimalNumber
    END-PERFORM.

BinaryToHex.
    EVALUATE TempBinary
     WHEN "0000" MOVE "0" TO TempHex
     WHEN "0001" MOVE "1" TO TempHex
     WHEN "0010" MOVE "2" TO TempHex
     WHEN "0011" MOVE "3" TO TempHex
     WHEN "0100" MOVE "4" TO TempHex
     WHEN "0101" MOVE "5" TO TempHex
     WHEN "0110" MOVE "6" TO TempHex
     WHEN "0111" MOVE "7" TO TempHex
     WHEN "1000" MOVE "8" TO TempHex
     WHEN "1001" MOVE "9" TO TempHex
     WHEN "1010" MOVE "A" TO TempHex
     WHEN "1011" MOVE "B" TO TempHex
     WHEN "1100" MOVE "C" TO TempHex
     WHEN "1101" MOVE "D" TO TempHex
     WHEN "1110" MOVE "E" TO TempHex
     WHEN "1111" MOVE "F" TO TempHex
     WHEN OTHER DISPLAY "Error: Invalid binary digit."
    END-EVALUATE.

