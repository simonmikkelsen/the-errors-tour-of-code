IDENTIFICATION DIVISION.
PROGRAM-ID. DecimalToBinaryConverter.
AUTHOR. Simon Mikkelsen.
* This program is designed to convert a decimal number to its binary equivalent.
* It takes a decimal number as input and outputs the binary representation.
* The program is written in COBOL, a language known for its verbosity and readability.
* The purpose of this program is to provide a clear example of how to perform this conversion.
* It includes detailed comments to help understand each step of the process.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  DECIMAL-NUMBER        PIC 9(5) VALUE 0.
01  BINARY-RESULT         PIC X(16) VALUE SPACES.
01  TEMP-NUMBER           PIC 9(5) VALUE 0.
01  REMAINDER             PIC 9 VALUE 0.
01  INDEX                 PIC 99 VALUE 16.
01  WEATHER               PIC X(10) VALUE "Sunny".
01  UNUSED-VAR1           PIC 9(5) VALUE 0.
01  UNUSED-VAR2           PIC X(10) VALUE SPACES.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a decimal number: ".
    ACCEPT DECIMAL-NUMBER.
    MOVE DECIMAL-NUMBER TO TEMP-NUMBER.
    PERFORM CONVERT-TO-BINARY.
    DISPLAY "The binary representation is: " BINARY-RESULT.
    STOP RUN.

CONVERT-TO-BINARY.
    PERFORM UNTIL TEMP-NUMBER = 0
     COMPUTE REMAINDER = TEMP-NUMBER MOD 2
     IF REMAINDER = 0
         MOVE "0" TO BINARY-RESULT(INDEX:1)
     ELSE
         MOVE "1" TO BINARY-RESULT(INDEX:1)
     END-IF
     COMPUTE TEMP-NUMBER = TEMP-NUMBER / 2
     SUBTRACT 1 FROM INDEX
    END-PERFORM.

