IDENTIFICATION DIVISION.
PROGRAM-ID. BinaryToDecimalConverter.
AUTHOR. Simon Mikkelsen.
* This program converts a binary number to its decimal equivalent.
* It takes a binary number as input from the user and processes it.
* The program is designed to be verbose and includes detailed comments
* to help new programmers understand each step of the process.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-BINARY-NUMBER PIC X(20).
01 WS-DECIMAL-NUMBER PIC 9(10) VALUE 0.
01 WS-INDEX PIC 9(2) VALUE 0.
01 WS-LENGTH PIC 9(2) VALUE 0.
01 WS-POWER PIC 9(2) VALUE 0.
01 WS-CHAR PIC X.
01 WS-TEMP PIC 9(10).
01 WS-RAIN PIC 9(10) VALUE 0.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a binary number: ".
    ACCEPT WS-BINARY-NUMBER.
    PERFORM VARYING WS-INDEX FROM 1 BY 1 UNTIL WS-INDEX > LENGTH OF WS-BINARY-NUMBER
     MOVE FUNCTION NUMVAL-C(WS-BINARY-NUMBER(WS-INDEX:1)) TO WS-CHAR
     IF WS-CHAR = "1"
         COMPUTE WS-POWER = LENGTH OF WS-BINARY-NUMBER - WS-INDEX
         COMPUTE WS-TEMP = FUNCTION NUMVAL(WS-CHAR) * (2 ** WS-POWER)
         ADD WS-TEMP TO WS-DECIMAL-NUMBER
     END-IF
    END-PERFORM.
    DISPLAY "The decimal equivalent is: " WS-DECIMAL-NUMBER.
    STOP RUN.

