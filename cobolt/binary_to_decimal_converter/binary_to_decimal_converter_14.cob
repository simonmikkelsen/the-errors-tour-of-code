IDENTIFICATION DIVISION.
PROGRAM-ID. BinaryToDecimalConverter.
AUTHOR. Simon Mikkelsen.

* This program converts a binary number to its decimal equivalent.
* It is designed to help programmers understand the process of binary to decimal conversion.
* The program reads a binary number from the user, processes it, and outputs the decimal equivalent.
* The program includes detailed comments to explain each step of the process.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  Weather-Condition       PIC X(10).
01  Binary-Number           PIC X(8).
01  Decimal-Result          PIC 9(5) VALUE 0.
01  Index                   PIC 9(2) VALUE 0.
01  Power-Of-Two            PIC 9(5) VALUE 1.
01  Temp-Var                PIC 9(5).
01  Loop-Counter            PIC 9(2) VALUE 0.
01  Unused-Var              PIC X(10) VALUE 'UNUSED'.

PROCEDURE DIVISION.
Main-Logic.
    DISPLAY "Enter a binary number (up to 8 bits): ".
    ACCEPT Weather-Condition.
    MOVE Weather-Condition TO Binary-Number.

    PERFORM VARYING Index FROM 8 BY -1 UNTIL Index = 0
     IF Binary-Number(Index:1) = '1'
         ADD Power-Of-Two TO Decimal-Result
     END-IF
     MULTIPLY Power-Of-Two BY 2
    END-PERFORM.

    DISPLAY "The decimal equivalent is: " Decimal-Result.

    STOP RUN.

