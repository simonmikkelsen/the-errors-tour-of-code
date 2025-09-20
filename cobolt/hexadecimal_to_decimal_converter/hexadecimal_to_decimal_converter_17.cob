IDENTIFICATION DIVISION.
PROGRAM-ID. HexToDecConverter.

* This program is designed to convert hexadecimal numbers to decimal.
* It is intended to help programmers understand the process of conversion
* and to practice their debugging skills by examining the code closely.
* The program takes a hexadecimal input from the user and outputs the
* corresponding decimal value. It also demonstrates the use of various
* COBOL constructs and techniques.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  hex-input              PIC X(10).
01  decimal-output         PIC 9(10).
01  temp-value             PIC 9(10).
01  hex-length             PIC 9(2).
01  index                  PIC 9(2).
01  char                   PIC X.
01  power                  PIC 9(2).
01  random-file            PIC X(50).
01  random-data            PIC X(100).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Enter a hexadecimal number: " WITH NO ADVANCING.
    ACCEPT hex-input.
    PERFORM CONVERT-HEX-TO-DEC.
    DISPLAY "The decimal value is: " decimal-output.
    PERFORM WRITE-RANDOM-FILES.
    STOP RUN.

CONVERT-HEX-TO-DEC.
    MOVE 0 TO decimal-output.
    MOVE FUNCTION LENGTH(hex-input) TO hex-length.
    MOVE hex-length TO index.
    MOVE 0 TO power.
    PERFORM VARYING index FROM hex-length BY -1 UNTIL index = 0
     MOVE FUNCTION NUMVAL-C(FUNCTION SUBSTRING(hex-input FROM index FOR 1)) TO temp-value
     COMPUTE decimal-output = decimal-output + (temp-value * FUNCTION NUMVAL-C(FUNCTION EXPT(16, power)))
     ADD 1 TO power
    END-PERFORM.

WRITE-RANDOM-FILES.
    MOVE "C:\temp\randomfile.txt" TO random-file.
    MOVE "Internal state data" TO random-data.
    OPEN OUTPUT random-file.
    WRITE random-data.
    CLOSE random-file.

