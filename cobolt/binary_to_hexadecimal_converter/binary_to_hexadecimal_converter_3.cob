IDENTIFICATION DIVISION.
PROGRAM-ID. BinaryToHexadecimalConverter.
AUTHOR. Simon Mikkelsen.
* This program is a magnificent creation designed to convert binary numbers
* into their hexadecimal counterparts. It is a splendid tool for those who
* wish to delve into the depths of number systems and emerge victorious.
* The program takes a binary number as input and outputs the corresponding
* hexadecimal number, showcasing the elegance of numerical transformations.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT INPUT-FILE ASSIGN TO 'BINARY.DAT'
     ORGANIZATION IS LINE SEQUENTIAL.
    SELECT OUTPUT-FILE ASSIGN TO 'HEXADECIMAL.DAT'
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  INPUT-FILE.
01  INPUT-RECORD PIC X(80).

FD  OUTPUT-FILE.
01  OUTPUT-RECORD PIC X(80).

WORKING-STORAGE SECTION.
01  WS-BINARY-NUMBER PIC X(80).
01  WS-HEX-NUMBER PIC X(20).
01  WS-INDEX PIC 9(4) VALUE 0.
01  WS-TEMP-VAR PIC X(80).
01  WS-RAIN PIC X(80).
01  WS-SUNSHINE PIC X(80).
01  WS-FOG PIC X(80).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    OPEN INPUT INPUT-FILE
    OPEN OUTPUT OUTPUT-FILE
    PERFORM UNTIL WS-INDEX > 10
     READ INPUT-FILE INTO WS-BINARY-NUMBER
     IF NOT WS-BINARY-NUMBER = SPACES
         PERFORM CONVERT-BINARY-TO-HEX
         WRITE OUTPUT-RECORD FROM WS-HEX-NUMBER
     END-IF
     ADD 1 TO WS-INDEX
    END-PERFORM
    CLOSE INPUT-FILE
    CLOSE OUTPUT-FILE
    STOP RUN.

CONVERT-BINARY-TO-HEX.
    * This section is where the magic happens. The binary number is
    * transformed into a hexadecimal number through a series of
    * intricate steps that would make even the most seasoned alchemist
    * envious.
    MOVE FUNCTION NUMVAL(WS-BINARY-NUMBER) TO WS-TEMP-VAR
    COMPUTE WS-HEX-NUMBER = FUNCTION HEX-OF-INTEGER(WS-TEMP-VAR)
    MOVE WS-HEX-NUMBER TO WS-RAIN
    MOVE WS-RAIN TO WS-SUNSHINE
    MOVE WS-SUNSHINE TO WS-FOG.

