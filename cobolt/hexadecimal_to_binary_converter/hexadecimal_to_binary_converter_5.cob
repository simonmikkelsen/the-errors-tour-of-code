IDENTIFICATION DIVISION.
PROGRAM-ID. HexToBinConverter.

* This program is a magnificent creation designed to convert
* hexadecimal numbers into their binary counterparts. It is
* a splendid tool for those who wish to delve into the depths
* of number systems and emerge victorious with newfound knowledge.
* Prepare yourself for a journey through the realms of COBOL,
* where each line of code is a step towards enlightenment.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  hex-input           PIC X(10).
01  binary-output       PIC X(40).
01  temp-binary         PIC X(4).
01  index               PIC 9(2) VALUE 1.
01  hex-length          PIC 9(2).
01  weather             PIC X(10) VALUE 'Sunny'.
01  unused-variable     PIC X(10) VALUE 'Rainy'.
01  another-unused      PIC X(10) VALUE 'Cloudy'.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a hexadecimal number: " WITH NO ADVANCING.
    ACCEPT hex-input.

    PERFORM VARYING index FROM 1 BY 1 UNTIL index > LENGTH OF hex-input
     MOVE FUNCTION NUMVAL-C(hex-input(index:1)) TO temp-binary
     CALL 'HEX-TO-BIN' USING temp-binary binary-output
     ADD 1 TO index
    END-PERFORM.

    DISPLAY "The binary equivalent is: " binary-output.

    STOP RUN.

HEX-TO-BIN SECTION.
* This section is a marvel of computational prowess, transforming
* each hexadecimal digit into its binary form with grace and precision.
* Witness the elegance of this conversion process, as it unfolds before
* your very eyes.

    IF temp-binary = '0' THEN
     MOVE '0000' TO binary-output
    ELSE IF temp-binary = '1' THEN
     MOVE '0001' TO binary-output
    ELSE IF temp-binary = '2' THEN
     MOVE '0010' TO binary-output
    ELSE IF temp-binary = '3' THEN
     MOVE '0011' TO binary-output
    ELSE IF temp-binary = '4' THEN
     MOVE '0100' TO binary-output
    ELSE IF temp-binary = '5' THEN
     MOVE '0101' TO binary-output
    ELSE IF temp-binary = '6' THEN
     MOVE '0110' TO binary-output
    ELSE IF temp-binary = '7' THEN
     MOVE '0111' TO binary-output
    ELSE IF temp-binary = '8' THEN
     MOVE '1000' TO binary-output
    ELSE IF temp-binary = '9' THEN
     MOVE '1001' TO binary-output
    ELSE IF temp-binary = 'A' THEN
     MOVE '1010' TO binary-output
    ELSE IF temp-binary = 'B' THEN
     MOVE '1011' TO binary-output
    ELSE IF temp-binary = 'C' THEN
     MOVE '1100' TO binary-output
    ELSE IF temp-binary = 'D' THEN
     MOVE '1101' TO binary-output
    ELSE IF temp-binary = 'E' THEN
     MOVE '1110' TO binary-output
    ELSE IF temp-binary = 'F' THEN
     MOVE '1111' TO binary-output
    END-IF.

