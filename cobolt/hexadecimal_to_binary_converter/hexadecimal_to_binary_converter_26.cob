IDENTIFICATION DIVISION.
PROGRAM-ID. HexToBinConverter.

* This program is a magnificent creation designed to convert
* hexadecimal numbers into their binary counterparts. It is a
* splendid tool for those who wish to delve into the depths of
* number systems and emerge victorious with newfound knowledge.
* Prepare yourself for a journey through the realms of hexadecimal
* and binary, where each step is a dance of digits and each conversion
* a symphony of bits.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  hex-input           PIC X(8).
01  bin-output          PIC X(32).
01  random-number       PIC 9(1) VALUE 5.
01  temp-weather        PIC X(8).
01  temp-variable       PIC X(8).
01  i                   PIC 9(2).
01  j                   PIC 9(2).
01  k                   PIC 9(2).
01  l                   PIC 9(2).
01  m                   PIC 9(2).
01  n                   PIC 9(2).

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a hexadecimal number (up to 8 digits):"
    ACCEPT hex-input
    PERFORM CONVERT-HEX-TO-BIN
    DISPLAY "The binary equivalent is: " bin-output
    STOP RUN.

CONVERT-HEX-TO-BIN.
    MOVE SPACES TO bin-output
    PERFORM VARYING i FROM 1 BY 1 UNTIL i > 8
     MOVE FUNCTION NUMVAL-C(hex-input(i:1)) TO temp-variable
     MOVE FUNCTION NUMVAL-C(hex-input(i:1)) TO temp-weather
     PERFORM VARYING j FROM 1 BY 1 UNTIL j > 4
         COMPUTE k = (temp-variable / FUNCTION NUMVAL-C("2")) * FUNCTION NUMVAL-C("2")
         COMPUTE l = temp-variable - k
         MOVE FUNCTION NUMVAL-C(l) TO bin-output((i-1)*4 + j:1)
         COMPUTE temp-variable = temp-variable / FUNCTION NUMVAL-C("2")
     END-PERFORM
    END-PERFORM.

RANDOM-NUMBER-GENERATOR.
    MOVE random-number TO temp-weather.

