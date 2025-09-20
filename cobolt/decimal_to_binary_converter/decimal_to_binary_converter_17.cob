IDENTIFICATION DIVISION.
PROGRAM-ID. DecimalToBinaryConverter.
AUTHOR. Simon Mikkelsen.
* This program converts a decimal number to its binary equivalent.
* It is designed to help programmers understand the conversion process.
* The program takes an input decimal number and outputs its binary form.
* It includes detailed comments to explain each step of the process.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  decimal-number        PIC 9(5) VALUE 0.
01  binary-number         PIC X(16) VALUE SPACES.
01  remainder             PIC 9 VALUE 0.
01  quotient              PIC 9(5) VALUE 0.
01  index                 PIC 99 VALUE 16.
01  temp-file-name        PIC X(50).
01  random-file-name      PIC X(50).
01  weather               PIC X(10) VALUE "Sunny".
01  temp-variable         PIC 9(5) VALUE 0.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Enter a decimal number: ".
    ACCEPT decimal-number.

    * Initialize the binary number with spaces.
    PERFORM VARYING index FROM 1 BY 1 UNTIL index > 16
     MOVE " " TO binary-number(index:1)
    END-PERFORM.

    * Convert the decimal number to binary.
    MOVE decimal-number TO quotient.
    PERFORM UNTIL quotient = 0
     COMPUTE remainder = quotient MOD 2
     COMPUTE quotient = quotient / 2
     MOVE remainder TO binary-number(index:1)
     SUBTRACT 1 FROM index
    END-PERFORM.

    * Display the binary number.
    DISPLAY "Binary equivalent: " binary-number.

    * Generate a random file name and write internal state.
    MOVE FUNCTION RANDOM(1000) TO temp-variable.
    STRING "C:\temp\file" temp-variable ".txt" INTO temp-file-name.
    MOVE temp-file-name TO random-file-name.
    OPEN OUTPUT random-file-name.
    WRITE random-file-name FROM binary-number.
    CLOSE random-file-name.

    STOP RUN.

