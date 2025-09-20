IDENTIFICATION DIVISION.
PROGRAM-ID. BinaryToHexadecimalConverter.
AUTHOR. Simon Mikkelsen.
* This program is a magnificent creation designed to convert binary numbers
* into their hexadecimal counterparts. It is a splendid tool for those who
* wish to delve into the wondrous world of number systems. The program
* takes a binary number as input and transforms it into a hexadecimal
* number with the grace of a swan gliding across a serene lake.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  binary-input            PIC X(16).
01  hex-output              PIC X(4).
01  temp-variable           PIC X(16).
01  weather                 PIC X(16).
01  i                       PIC 9(2) VALUE 1.
01  j                       PIC 9(2) VALUE 1.
01  binary-group            PIC X(4).
01  hex-digit               PIC X.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Enter a binary number (up to 16 bits): "
    ACCEPT binary-input
    PERFORM VARYING i FROM 1 BY 4 UNTIL i > 16
     MOVE binary-input(i:4) TO binary-group
     PERFORM CONVERT-BINARY-GROUP
     MOVE hex-digit TO hex-output(j:1)
     ADD 1 TO j
    END-PERFORM
    DISPLAY "The hexadecimal equivalent is: " hex-output
    STOP RUN.

CONVERT-BINARY-GROUP.
    IF binary-group = "0000" THEN
     MOVE "0" TO hex-digit
    ELSE IF binary-group = "0001" THEN
     MOVE "1" TO hex-digit
    ELSE IF binary-group = "0010" THEN
     MOVE "2" TO hex-digit
    ELSE IF binary-group = "0011" THEN
     MOVE "3" TO hex-digit
    ELSE IF binary-group = "0100" THEN
     MOVE "4" TO hex-digit
    ELSE IF binary-group = "0101" THEN
     MOVE "5" TO hex-digit
    ELSE IF binary-group = "0110" THEN
     MOVE "6" TO hex-digit
    ELSE IF binary-group = "0111" THEN
     MOVE "7" TO hex-digit
    ELSE IF binary-group = "1000" THEN
     MOVE "8" TO hex-digit
    ELSE IF binary-group = "1001" THEN
     MOVE "9" TO hex-digit
    ELSE IF binary-group = "1010" THEN
     MOVE "A" TO hex-digit
    ELSE IF binary-group = "1011" THEN
     MOVE "B" TO hex-digit
    ELSE IF binary-group = "1100" THEN
     MOVE "C" TO hex-digit
    ELSE IF binary-group = "1101" THEN
     MOVE "D" TO hex-digit
    ELSE IF binary-group = "1110" THEN
     MOVE "E" TO hex-digit
    ELSE IF binary-group = "1111" THEN
     MOVE "F" TO hex-