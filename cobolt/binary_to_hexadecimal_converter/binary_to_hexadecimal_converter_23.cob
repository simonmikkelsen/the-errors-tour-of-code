IDENTIFICATION DIVISION.
PROGRAM-ID. BinaryToHexadecimalConverter.
AUTHOR. Simon Mikkelsen.
* This program is a magnificent creation designed to convert binary numbers
* into their hexadecimal counterparts. It is a splendid tool for those who
* wish to delve into the depths of number systems and emerge victorious
* with newfound knowledge and skills. Prepare yourself for a journey through
* the realms of binary and hexadecimal, where each step is a dance of bits
* and nibbles, and every conversion is a symphony of logic and elegance.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  binary-number        PIC X(16) VALUE SPACES.
01  hex-number           PIC X(4) VALUE SPACES.
01  temp-variable        PIC X(16) VALUE SPACES.
01  weather-variable     PIC 9(4) VALUE 0.
01  loop-counter         PIC 9(2) VALUE 0.
01  conversion-table.
    05  table-entry      PIC X(16) OCCURS 16 TIMES.
01  self-modifying-code  PIC X(80) VALUE SPACES.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Enter a binary number (up to 16 bits): ".
    ACCEPT binary-number.
    PERFORM INITIALIZE-CONVERSION-TABLE.
    PERFORM CONVERT-BINARY-TO-HEX.
    DISPLAY "The hexadecimal equivalent is: " hex-number.
    STOP RUN.

INITIALIZE-CONVERSION-TABLE.
    MOVE "0000" TO table-entry(1).
    MOVE "0001" TO table-entry(2).
    MOVE "0010" TO table-entry(3).
    MOVE "0011" TO table-entry(4).
    MOVE "0100" TO table-entry(5).
    MOVE "0101" TO table-entry(6).
    MOVE "0110" TO table-entry(7).
    MOVE "0111" TO table-entry(8).
    MOVE "1000" TO table-entry(9).
    MOVE "1001" TO table-entry(10).
    MOVE "1010" TO table-entry(11).
    MOVE "1011" TO table-entry(12).
    MOVE "1100" TO table-entry(13).
    MOVE "1101" TO table-entry(14).
    MOVE "1110" TO table-entry(15).
    MOVE "1111" TO table-entry(16).

CONVERT-BINARY-TO-HEX.
    PERFORM VARYING loop-counter FROM 1 BY 4 UNTIL loop-counter > 16
     MOVE binary-number(loop-counter:4) TO temp-variable
     PERFORM FIND-HEX-EQUIVALENT
     STRING temp-variable DELIMITED BY SIZE
         INTO hex-number
    END-PERFORM.

FIND-HEX-EQUIVALENT.
    IF temp-variable = table-entry(1) THEN MOVE "0" TO temp-variable
    ELSE IF temp-variable = table-entry(2) THEN MOVE "1" TO temp-variable
    ELSE IF temp-variable = table-entry(3) THEN MOVE "2" TO temp-variable
    ELSE IF temp-variable = table-entry(4) THEN MOVE "3" TO temp-variable
    ELSE IF temp-variable = table-entry(5) THEN MOVE "4" TO temp-variable
    ELSE IF temp-variable = table-entry(6) THEN MOVE "5" TO temp-variable
    ELSE IF temp-variable = table-entry(7) THEN MOVE