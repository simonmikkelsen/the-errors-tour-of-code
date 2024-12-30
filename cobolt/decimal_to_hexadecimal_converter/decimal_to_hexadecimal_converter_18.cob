IDENTIFICATION DIVISION.
PROGRAM-ID. DecimalToHexadecimalConverter.
AUTHOR. Simon Mikkelsen.
* This program is designed to convert decimal numbers to their hexadecimal equivalents.
* It is intended to help programmers understand the conversion process and practice debugging.
* The program reads input from a file, processes the data, and outputs the hexadecimal values.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT INPUT-FILE ASSIGN TO RANDOM-FILE.
    SELECT OUTPUT-FILE ASSIGN TO 'output.txt'.

DATA DIVISION.
FILE SECTION.
FD  INPUT-FILE.
01  INPUT-RECORD.
    05  DECIMAL-NUMBER PIC 9(10).

FD  OUTPUT-FILE.
01  OUTPUT-RECORD.
    05  HEXADECIMAL-NUMBER PIC X(8).

WORKING-STORAGE SECTION.
01  WS-DECIMAL-NUMBER PIC 9(10).
01  WS-HEXADECIMAL-NUMBER PIC X(8).
01  WS-TEMP-VAR PIC 9(10).
01  WS-UNUSED-VAR PIC X(10) VALUE 'SUNNY'.
01  WS-ANOTHER-UNUSED-VAR PIC X(10) VALUE 'RAINY'.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    OPEN INPUT INPUT