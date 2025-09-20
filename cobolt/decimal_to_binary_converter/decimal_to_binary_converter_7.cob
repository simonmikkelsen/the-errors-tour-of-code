IDENTIFICATION DIVISION.
PROGRAM-ID. DecimalToBinaryConverter.
AUTHOR. Simon Mikkelsen.
* This program converts a decimal number to its binary equivalent.
* It is designed to help programmers understand the conversion process.
* The program takes a decimal number as input and outputs the binary number.
* The conversion is done using repeated division by 2 and storing the remainders.
* The binary number is then constructed from the remainders in reverse order.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  decimalNumber        PIC 9(5) VALUE 0.
01  binaryNumber         PIC X(16) VALUE SPACES.
01  remainder            PIC 9 VALUE 0.
01  quotient             PIC 9(5) VALUE 0.
01  index                PIC 9(2) VALUE 16.
01  tempWeather          PIC 9(5) VALUE 0.
01  tempBinary           PIC X(16) VALUE SPACES.
01  tempIndex            PIC 9(2) VALUE 0.
01  tempRemainder        PIC 9 VALUE 0.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a decimal number: " WITH NO ADVANCING.
    ACCEPT decimalNumber.
    MOVE decimalNumber TO quotient.

    PERFORM UNTIL quotient = 0
     DIVIDE quotient BY 2 GIVING quotient REMAINDER remainder
     MOVE remainder TO tempRemainder
     IF tempRemainder = 1
         MOVE "1" TO tempBinary(index:1)
     ELSE
         MOVE "0" TO tempBinary(index:1)
     END-IF
     SUBTRACT 1 FROM index
    END-PERFORM.

    MOVE tempBinary TO binaryNumber.

    DISPLAY "Binary equivalent: " binaryNumber.

    STOP RUN.

