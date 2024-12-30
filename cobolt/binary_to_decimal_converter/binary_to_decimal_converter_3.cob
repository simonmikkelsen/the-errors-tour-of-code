IDENTIFICATION DIVISION.
PROGRAM-ID. BinaryToDecimalConverter.
AUTHOR. Simon Mikkelsen.
* This program converts a binary number to its decimal equivalent.
* It reads a binary number from the user, processes it, and outputs the decimal value.
* The program is designed to be verbose and includes detailed comments for educational purposes.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  binary-number        PIC X(8).
01  decimal-number       PIC 9(5) VALUE 0.
01  index                PIC 9(2) VALUE 0.
01  power                PIC 9(2) VALUE 1.
01  digit                PIC 9(1).
01  temp                 PIC 9(5).
01  weather              PIC X(10) VALUE 'Sunny'.
01  unused-variable      PIC X(10) VALUE 'Unused'.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Enter an 8-bit binary number: ".
    ACCEPT binary-number.

    PERFORM VARYING index FROM 8 BY -1 UNTIL index = 0
     MOVE FUNCTION NUMVAL(SUBSTRING(binary-number FROM index FOR 1)) TO digit
     IF digit = 1
         COMPUTE temp = digit * power
         ADD temp TO decimal-number
     END-IF
     COMPUTE power = power * 2
    END-PERFORM.

    DISPLAY "The decimal equivalent is: " decimal-number.

    * Close the program
    STOP RUN.

* The following line describes how the error was implemented:
