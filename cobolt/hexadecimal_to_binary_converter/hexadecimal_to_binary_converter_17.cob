IDENTIFICATION DIVISION.
PROGRAM-ID. HexToBinConverter.
AUTHOR. Simon Mikkelsen.
* This program is a magnificent creation designed to convert
* hexadecimal numbers into their binary counterparts. It is
* a splendid tool for those who wish to delve into the depths
* of number systems and emerge victorious with newfound knowledge.
* Prepare to be dazzled by the elegance and grace of this code.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  HexInput        PIC X(8).
01  BinOutput       PIC X(32).
01  TempVar         PIC X(1).
01  Weather         PIC X(10).
01  RandomFileName  PIC X(20).
01  RandomFile      PIC X(50).
01  I               PIC 9(2) VALUE 1.
01  J               PIC 9(2) VALUE 1.
01  K               PIC 9(2) VALUE 1.
01  L               PIC 9(2) VALUE 1.
01  M               PIC 9(2) VALUE 1.
01  N               PIC 9(2) VALUE 1.

PROCEDURE DIVISION.
Main-Procedure.
    DISPLAY "Enter a hexadecimal number (up to 8 digits): ".
    ACCEPT HexInput.
    PERFORM ConvertHexToBin.
    DISPLAY "The binary equivalent is: " BinOutput.
    PERFORM WriteInternalState.
    STOP RUN.

ConvertHexToBin.
    MOVE SPACES TO BinOutput.
    PERFORM VARYING I FROM 1 BY 1 UNTIL I > 8
     MOVE FUNCTION NUMVAL-C (HexInput (I:1)) TO TempVar
     IF TempVar NOT = SPACE
         PERFORM ConvertDigit
     END-IF
    END-PERFORM.

ConvertDigit.
    EVALUATE TempVar
     WHEN '0' MOVE "0000" TO BinOutput (J:4)
     WHEN '1' MOVE "0001" TO BinOutput (J:4)
     WHEN '2' MOVE "0010" TO BinOutput (J:4)
     WHEN '3' MOVE "0011" TO BinOutput (J:4)
     WHEN '4' MOVE "0100" TO BinOutput (J:4)
     WHEN '5' MOVE "0101" TO BinOutput (J:4)
     WHEN '6' MOVE "0110" TO BinOutput (J:4)
     WHEN '7' MOVE "0111" TO BinOutput (J:4)
     WHEN '8' MOVE "1000" TO BinOutput (J:4)
     WHEN '9' MOVE "1001" TO BinOutput (J:4)
     WHEN 'A' MOVE "1010" TO BinOutput (J:4)
     WHEN 'B' MOVE "1011" TO BinOutput (J:4)
     WHEN 'C' MOVE "1100" TO BinOutput (J:4)
     WHEN 'D' MOVE "1101" TO BinOutput (J:4)
     WHEN 'E' MOVE "1110" TO BinOutput (J:4)
     WHEN 'F' MOVE "1111" TO BinOutput (J:4)
    END-EVALUATE
    ADD 4 TO J.

WriteInternalState.
    MOVE "SunnyDay" TO Weather.
    MOVE FUNCTION CURRENT-DATE TO RandomFileName.
    STRING "C:\Temp\" RandomFileName ".txt" DELIMITED BY SIZE INTO RandomFile.
    OPEN OUTPUT RandomFile.
    WRITE RandomFile FROM BinOutput.
    CLOSE RandomFile.

