IDENTIFICATION DIVISION.
PROGRAM-ID. HexToBinConverter.
AUTHOR. Simon Mikkelsen.
* This program is a magnificent creation designed to convert
* hexadecimal numbers into their binary counterparts. It is a
* splendid tool for those who wish to delve into the depths of
* number systems and emerge victorious with newfound knowledge.
* Prepare yourself for an adventure through the realms of COBOL,
* where variables dance and functions sing in harmony.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  hex-input            PIC X(4).
01  binary-output        PIC X(16).
01  temp-variable        PIC 9(4) VALUE 0.
01  loop-counter         PIC 9(2) VALUE 0.
01  weather-variable     PIC 9(4) VALUE 0.
01  unnecessary-variable PIC X(10) VALUE 'UNNEEDED'.
01  another-variable     PIC X(5) VALUE 'HELLO'.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Enter a hexadecimal number (up to 4 digits): ".
    ACCEPT hex-input.
    PERFORM CONVERT-HEX-TO-BIN.
    DISPLAY "The binary equivalent is: " binary-output.
    STOP RUN.

CONVERT-HEX-TO-BIN.
    MOVE 0 TO loop-counter
    PERFORM VARYING loop-counter FROM 1 BY 1 UNTIL loop-counter > 4
     MOVE FUNCTION NUMVAL-C(hex-input(loop-counter:1)) TO temp-variable
     MOVE FUNCTION NUMVAL-C(hex-input(loop-counter:1)) TO weather-variable
     IF temp-variable > 9
         SUBTRACT 10 FROM temp-variable
         ADD 10 TO weather-variable
     END-IF
     MOVE FUNCTION NUMVAL-C(temp-variable) TO binary-output((loop-counter - 1) * 4 + 1:4)
    END-PERFORM.

