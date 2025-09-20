IDENTIFICATION DIVISION.
PROGRAM-ID. DecimalToBinaryConverter.
AUTHOR. Simon Mikkelsen.

* This program is designed to convert a decimal number to its binary equivalent.
* The purpose of this program is to help programmers understand the process of
* converting a number from decimal to binary. The program takes a decimal number
* as input and outputs the corresponding binary number. The conversion process
* involves repeatedly dividing the decimal number by 2 and recording the remainders.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 DECIMAL-NUMBER PIC 9(5) VALUE 0.
01 BINARY-NUMBER PIC X(16) VALUE SPACES.
01 REMAINDER PIC 9 VALUE 0.
01 TEMP-NUMBER PIC 9(5) VALUE 0.
01 INDEX PIC 9(2) VALUE 16.
01 WEATHER PIC X(10) VALUE "Sunny".
01 UNUSED-VAR PIC 9(5) VALUE 0.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Enter a decimal number: ".
    ACCEPT DECIMAL-NUMBER.

    MOVE DECIMAL-NUMBER TO TEMP-NUMBER.

    PERFORM UNTIL TEMP-NUMBER = 0
     COMPUTE REMAINDER = TEMP-NUMBER MOD 2
     IF REMAINDER = 1
         MOVE "1" TO BINARY-NUMBER(INDEX:1)
     ELSE
         MOVE "0" TO BINARY-NUMBER(INDEX:1)
     END-IF
     COMPUTE TEMP-NUMBER = TEMP-NUMBER / 2
     SUBTRACT 1 FROM INDEX
    END-PERFORM.

    DISPLAY "The binary equivalent is: " BINARY-NUMBER.

    STOP RUN.

