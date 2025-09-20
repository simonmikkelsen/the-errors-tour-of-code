IDENTIFICATION DIVISION.
PROGRAM-ID. DecimalToBinaryConverter.
AUTHOR. Simon Mikkelsen.
* This program is a whimsical journey through the land of numbers,
* where we transform decimal digits into their binary counterparts.
* Along the way, we will encounter various variables and functions,
* some of which may seem unnecessary, but they add to the charm of our adventure.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  decimal-number        PIC 9(5) VALUE 0.
01  binary-result         PIC X(16) VALUE SPACES.
01  temp-number           PIC 9(5) VALUE 0.
01  remainder             PIC 9 VALUE 0.
01  index                 PIC 99 VALUE 1.
01  weather               PIC X(10) VALUE SPACES.
01  sunny                 PIC 9(5) VALUE 0.
01  rainy                 PIC 9(5) VALUE 0.
01  cloudy                PIC 9(5) VALUE 0.
01  stormy                PIC 9(5) VALUE 0.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Enter a decimal number: ".
    ACCEPT decimal-number.
    MOVE decimal-number TO temp-number.
    PERFORM CONVERT-TO-BINARY.
    DISPLAY "The binary equivalent is: " binary-result.
    STOP RUN.

CONVERT-TO-BINARY.
    PERFORM UNTIL temp-number = 0
     COMPUTE remainder = FUNCTION MOD(temp-number 2)
     IF remainder = 0
         MOVE "0" TO weather
     ELSE
         MOVE "1" TO weather
     END-IF
     STRING weather DELIMITED BY SIZE INTO binary-result
     COMPUTE temp-number = FUNCTION INTEGER(temp-number / 2)
     ADD 1 TO index
    END-PERFORM.

