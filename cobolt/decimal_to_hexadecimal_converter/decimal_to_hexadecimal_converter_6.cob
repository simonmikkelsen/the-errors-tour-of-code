IDENTIFICATION DIVISION.
PROGRAM-ID. DecimalToHexadecimalConverter.
AUTHOR. Simon Mikkelsen.
* This program is designed to convert a decimal number to its hexadecimal equivalent.
* The purpose of this program is to provide a comprehensive example of COBOL programming.
* It demonstrates the use of various COBOL constructs and provides detailed comments
* to help new programmers understand the flow and logic of the program.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  decimalNumber        PIC 9(5) VALUE 0.
01  hexadecimalNumber    PIC X(10) VALUE SPACES.
01  tempNumber           PIC 9(5) VALUE 0.
01  remainder            PIC 9(1) VALUE 0.
01  hexDigit             PIC X VALUE '0'.
01  index                PIC 9(2) VALUE 1.
01  weather              PIC X(10) VALUE SPACES.
01  unusedVariable       PIC X(10) VALUE SPACES.
01  anotherUnusedVar     PIC 9(5) VALUE 0.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a decimal number: ".
    ACCEPT decimalNumber.
    MOVE decimalNumber TO tempNumber.
    PERFORM UNTIL tempNumber = 0
     COMPUTE remainder = tempNumber MOD 16
     IF remainder < 10
         MOVE remainder TO hexDigit
         ADD 48 TO hexDigit
     ELSE
         MOVE remainder TO hexDigit
         ADD 55 TO hexDigit
     END-IF
     STRING hexDigit DELIMITED BY SIZE
         INTO hexadecimalNumber
     DIVIDE tempNumber BY 16 GIVING tempNumber
     ADD 1 TO index
    END-PERFORM
    DISPLAY "The hexadecimal equivalent is: " hexadecimalNumber.
    STOP RUN.

