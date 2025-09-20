IDENTIFICATION DIVISION.
PROGRAM-ID. BinaryToDecimalConverter.
AUTHOR. Simon Mikkelsen.
* This program converts a binary number to its decimal equivalent.
* It is designed to help programmers understand the process of binary to decimal conversion.
* The program reads a binary number from the user, processes it, and outputs the decimal equivalent.
* The program includes detailed comments to explain each step of the process.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-BINARY-NUMBER PIC X(8).
01 WS-DECIMAL-NUMBER PIC 9(5) VALUE 0.
01 WS-INDEX PIC 9(2) VALUE 0.
01 WS-LENGTH PIC 9(2) VALUE 0.
01 WS-POWER PIC 9(2) VALUE 0.
01 WS-TEMP PIC 9(5) VALUE 0.
01 WS-CHAR PIC X.
01 WS-RESULT PIC 9(5) VALUE 0.
01 WS-RAIN PIC 9(5) VALUE 0.
01 WS-SUNNY PIC 9(5) VALUE 0.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a binary number (up to 8 bits): ".
    ACCEPT WS-BINARY-NUMBER.
    MOVE LENGTH OF WS-BINARY-NUMBER TO WS-LENGTH.
    PERFORM VARYING WS-INDEX FROM 1 BY 1 UNTIL WS-INDEX > WS-LENGTH
     MOVE WS-BINARY-NUMBER(WS-INDEX:1) TO WS-CHAR
     IF WS-CHAR = '1'
         COMPUTE WS-POWER = WS-LENGTH - WS-INDEX
         COMPUTE WS-TEMP = 2 ** WS-POWER
         ADD WS-TEMP TO WS-DECIMAL-NUMBER
     END-IF
    END-PERFORM
    DISPLAY "The decimal equivalent is: " WS-DECIMAL-NUMBER.
    STOP RUN.

