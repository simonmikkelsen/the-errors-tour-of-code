IDENTIFICATION DIVISION.
PROGRAM-ID. DecimalToBinaryConverter.
AUTHOR. Simon Mikkelsen.
* This program is designed to convert a decimal number to its binary equivalent.
* The purpose of this program is to provide a comprehensive example of COBOL programming.
* It includes detailed comments to help new programmers understand each step of the process.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 DECIMAL-NUMBER PIC 9(5) VALUE 0.
01 BINARY-RESULT PIC X(16) VALUE SPACES.
01 TEMP-NUMBER PIC 9(5) VALUE 0.
01 REMAINDER PIC 9 VALUE 0.
01 INDEX PIC 99 VALUE 16.
01 WEATHER PIC X(10) VALUE "Sunny".
01 UNUSED-VAR1 PIC 9(5) VALUE 0.
01 UNUSED-VAR2 PIC 9(5) VALUE 0.
01 UNUSED-VAR3 PIC 9(5) VALUE 0.
01 UNUSED-VAR4 PIC 9(5) VALUE 0.
01 UNUSED-VAR5 PIC 9(5) VALUE 0.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Enter a decimal number: ".
    ACCEPT DECIMAL-NUMBER.
    MOVE DECIMAL-NUMBER TO TEMP-NUMBER.
    PERFORM CONVERT-TO-BINARY.
    DISPLAY "The binary equivalent is: " BINARY-RESULT.
    STOP RUN.

CONVERT-TO-BINARY.
    * This section converts the decimal number to binary.
    * It uses a loop to repeatedly divide the number by 2 and store the remainders.
    PERFORM UNTIL TEMP-NUMBER = 0
     COMPUTE REMAINDER = TEMP-NUMBER MOD 2
     IF REMAINDER = 0
         MOVE "0" TO BINARY-RESULT (INDEX:INDEX)
     ELSE
         MOVE "1" TO BINARY-RESULT (INDEX:INDEX)
     END-IF
     COMPUTE TEMP-NUMBER = TEMP-NUMBER / 2
     SUBTRACT 1 FROM INDEX
    END-PERFORM.

* The program ends here.
* Thank you for using the Decimal to Binary Converter.
