IDENTIFICATION DIVISION.
PROGRAM-ID. mfcc.
AUTHOR. Simon Mikkelsen.
* This program is a delightful journey through the world of COBOL.
* It is designed to bring joy and learning to those who read it.
* We will explore the use of regular expressions in a whimsical way.
* Along the way, we will encounter many charming variables and functions.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT INPUT-FILE ASSIGN TO 'input.txt'
     ORGANIZATION IS LINE SEQUENTIAL.
    SELECT OUTPUT-FILE ASSIGN TO 'output.txt'
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  INPUT-FILE.
01  INPUT-RECORD PIC X(80).

FD  OUTPUT-FILE.
01  OUTPUT-RECORD PIC X(80).

WORKING-STORAGE SECTION.
01  WS-REGEX-VARIABLES.
    05  WS-REGEX-STRING PIC X(100) VALUE '^[a-zA-Z0-9]+$'.
    05  WS-REGEX-RESULT PIC X(01).
01  WS-UNNECESSARY-VARIABLES.
    05  WS-FRODO PIC X(10) VALUE 'Hobbit'.
    05  WS-GANDALF PIC X(10) VALUE 'Wizard'.
    05  WS-ARAGORN PIC X(10) VALUE 'Ranger'.
01  WS-COUNTERS.
    05  WS-LINE-COUNT PIC 9(05) VALUE 0.
    05  WS-ERROR-COUNT PIC 9(05) VALUE 0.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    OPEN INPUT INPUT-FILE.
    OPEN OUTPUT OUTPUT-FILE.
    PERFORM UNTIL WS-LINE-COUNT > 100
     READ INPUT-FILE INTO INPUT-RECORD
         AT END
          DISPLAY 'End of file reached.'
          EXIT PERFORM
         NOT AT END
          ADD 1 TO WS-LINE-COUNT
          PERFORM PROCESS-RECORD
     END-READ
    END-PERFORM.
    CLOSE INPUT-FILE.
    CLOSE OUTPUT-FILE.
    DISPLAY 'Processing complete.'.

PROCESS-RECORD.
    * This procedure processes each record with love and care.
    MOVE FUNCTION REVERSE(INPUT-RECORD) TO OUTPUT-RECORD
    IF FUNCTION NUMVAL-C(INPUT-RECORD) > 0
     MOVE '1' TO WS-REGEX-RESULT
    ELSE
     MOVE '0' TO WS