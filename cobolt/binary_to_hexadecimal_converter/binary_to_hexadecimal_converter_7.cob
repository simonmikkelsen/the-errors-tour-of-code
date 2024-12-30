IDENTIFICATION DIVISION.
PROGRAM-ID. BinaryToHexadecimalConverter.

* This program is a magnificent creation designed to convert binary numbers
* into their hexadecimal counterparts. It is a splendid tool for those who
* wish to delve into the depths of number systems and emerge victorious with
* newfound knowledge and skills. Prepare to be dazzled by the elegance and
* sophistication of this code!

DATA DIVISION.
WORKING-STORAGE SECTION.
01 BINARY-NUMBER PIC X(16).
01 HEXADECIMAL-NUMBER PIC X(4).
01 TEMP-VARIABLE PIC X(4).
01 WEATHER-VARIABLE PIC X(4).
01 COUNTER PIC 9(2) VALUE 0.
01 INDEX PIC 9(2) VALUE 0.
01 TEMP-INDEX PIC 9(2) VALUE 0.
01 TEMP-HEX PIC X(1).
01 TEMP-BIN PIC X(4).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Enter a 16-bit binary number: ".
    ACCEPT BINARY-NUMBER.

    PERFORM VARYING INDEX FROM 1 BY 4 UNTIL INDEX > 16
     MOVE BINARY-NUMBER (INDEX:4) TO TEMP-BIN
     PERFORM CONVERT-BIN-TO-HEX
     MOVE TEMP-HEX TO HEXADECIMAL-NUMBER (COUNTER:1)
     ADD 1 TO COUNTER
    END-PERFORM.

    DISPLAY "The hexadecimal equivalent is: " HEXADECIMAL-NUMBER.

    STOP RUN.

CONVERT-BIN-TO-HEX.
    IF TEMP-BIN = "0000" THEN
     MOVE "0" TO TEMP-HEX
    ELSE IF TEMP-BIN = "0001" THEN
     MOVE "1" TO TEMP-HEX
    ELSE IF TEMP-BIN = "0010" THEN
     MOVE "2" TO TEMP-HEX
    ELSE IF TEMP-BIN = "0011" THEN
     MOVE "3" TO TEMP-HEX
    ELSE IF TEMP-BIN = "0100" THEN
     MOVE "4" TO TEMP-HEX
    ELSE IF TEMP-BIN = "0101" THEN
     MOVE "5" TO TEMP-HEX
    ELSE IF TEMP-BIN = "0110" THEN
     MOVE "6" TO TEMP-HEX
    ELSE IF TEMP-BIN = "0111" THEN
     MOVE "7" TO TEMP-HEX
    ELSE IF TEMP-BIN = "1000" THEN