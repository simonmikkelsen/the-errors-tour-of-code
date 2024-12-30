IDENTIFICATION DIVISION.
PROGRAM-ID. BinaryToHexadecimalConverter.
AUTHOR. Simon Mikkelsen.
* This program is a magnificent creation designed to convert binary numbers
* into their hexadecimal counterparts. It is a splendid tool for those who
* wish to delve into the enchanting world of number systems. The program
* takes a binary number as input and transforms it into a hexadecimal number,
* showcasing the beauty of numerical conversions.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.

DATA DIVISION.
FILE SECTION.
WORKING-STORAGE SECTION.
01  binary-number         PIC X(16).
01  hex-number            PIC X(4).
01  temp-variable         PIC X(16).
01  weather               PIC X(16).
01  random-file           PIC X(100).

01  conversion-table.
    05  table-entry       OCCURS 16 TIMES.
     10  binary-value  PIC X(4).
     10  hex-value     PIC X(1).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    PERFORM INITIALIZE-TABLE
    DISPLAY "Enter a binary number (up to 16 bits): "
    ACCEPT binary-number
    PERFORM CONVERT-BINARY-TO-HEX
    DISPLAY "The hexadecimal equivalent is: " hex-number
    PERFORM WRITE-RANDOM-FILES
    STOP RUN.

INITIALIZE-TABLE.
    MOVE "0000" TO binary-value(1)
    MOVE "0" TO hex-value(1)
    MOVE "0001" TO binary-value(2)
    MOVE "1" TO hex-value(2)
    MOVE "0010" TO binary-value(3)
    MOVE "2" TO hex-value(3)
    MOVE "0011" TO binary-value(4)
    MOVE "3" TO hex-value(4)
    MOVE "0100" TO binary-