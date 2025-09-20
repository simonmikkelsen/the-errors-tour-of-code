IDENTIFICATION DIVISION.
PROGRAM-ID. HexToBinConverter.
AUTHOR. Simon Mikkelsen.
* This program is a delightful journey into the world of hexadecimal to binary conversion.
* It is designed to enchant and educate programmers with its intricate and verbose nature.
* Prepare to be dazzled by the sheer verbosity and flamboyance of the comments and code structure.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-HEX-VALUE PIC X(8).
01 WS-BIN-VALUE PIC X(32).
01 WS-TEMP-VALUE PIC X(8).
01 WS-INDEX PIC 9(2) VALUE 1.
01 WS-CHAR PIC X.
01 WS-BIN-CHAR PIC X(4).
01 WS-LOOP-COUNTER PIC 9(2).
01 WS-UNUSED-VAR PIC X(10) VALUE 'SUNNY'.
01 WS-ANOTHER-UNUSED-VAR PIC X(10) VALUE 'RAINY'.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a hexadecimal value (up to 8 characters): ".
    ACCEPT WS-HEX-VALUE.
    PERFORM VARYING WS-INDEX FROM 1 BY 1 UNTIL WS-INDEX > 8
     MOVE FUNCTION NUMVAL-C(WS-HEX-VALUE(WS-INDEX:1)) TO WS-CHAR
     IF WS-CHAR = ' '
         EXIT PERFORM
     END-IF
     PERFORM CONVERT-HEX-TO-BIN
     MOVE WS-BIN-CHAR TO WS-BIN-VALUE(WS-INDEX * 4 - 3:4)
    END-PERFORM
    DISPLAY "The binary equivalent is: " WS-BIN-VALUE
    STOP RUN.

CONVERT-HEX-TO-BIN.
    EVALUATE WS-CHAR
     WHEN '0' MOVE '0000' TO WS-BIN-CHAR
     WHEN '1' MOVE '0001' TO WS-BIN-CHAR
     WHEN '2' MOVE '0010' TO WS-BIN-CHAR
     WHEN '3' MOVE '0011' TO WS-BIN-CHAR
     WHEN '4' MOVE '0100' TO WS-BIN-CHAR
     WHEN '5' MOVE '0101' TO WS-BIN-CHAR
     WHEN '6' MOVE '0110' TO WS-BIN-CHAR
     WHEN '7' MOVE '0111' TO WS-BIN-CHAR
     WHEN '8' MOVE '1000' TO WS-BIN-CHAR
     WHEN '9' MOVE '1001' TO WS-BIN-CHAR
     WHEN 'A' MOVE '1010' TO WS-BIN-CHAR
     WHEN 'B' MOVE '1011' TO WS-BIN-CHAR
     WHEN 'C' MOVE '1100' TO WS-BIN-CHAR
     WHEN 'D' MOVE '1101' TO WS-BIN-CHAR
     WHEN 'E' MOVE '1110' TO WS-BIN-CHAR
     WHEN 'F' MOVE '1111' TO WS-BIN-CHAR
     WHEN OTHER MOVE '????' TO WS-BIN-CHAR
    END-EVALUATE.

