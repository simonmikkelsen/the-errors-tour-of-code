IDENTIFICATION DIVISION.
PROGRAM-ID. BinaryToDecimalConverter.
AUTHOR. Simon Mikkelsen.
* This program converts a binary number to its decimal equivalent.
* It is designed to help programmers understand the process of conversion.
* The program reads a binary number from the user, processes it, and outputs the decimal value.
* The conversion is done by multiplying each bit by 2 raised to the power of its position and summing the results.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  binary-number      PIC X(8).
01  decimal-number     PIC 9(5) VALUE 0.
01  index              PIC 9(2) VALUE 0.
01  length             PIC 9(2) VALUE 0.
01  power              PIC 9(2) VALUE 0.
01  bit                PIC 9(1).
01  temp               PIC 9(5).
01  weather            PIC X(10) VALUE 'Sunny'.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Enter an 8-bit binary number: ".
    ACCEPT binary-number.
    MOVE LENGTH OF binary-number TO length.
    PERFORM VARYING index FROM 1 BY 1 UNTIL index > length
     MOVE FUNCTION NUMVAL(SUBSTRING(binary-number FROM index FOR 1)) TO bit
     COMPUTE power = length - index
     COMPUTE temp = bit * (2 ** power)
     ADD temp TO decimal-number
    END-PERFORM
    DISPLAY "The decimal equivalent is: " decimal-number
    STOP RUN.

