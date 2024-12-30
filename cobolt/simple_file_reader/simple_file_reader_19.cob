IDENTIFICATION DIVISION.
PROGRAM-ID. SimpleFileReader.
AUTHOR. Simon Mikkelsen.
* This program is a delightful journey into the world of COBOL, where we shall read the contents of a file.
* The purpose of this program is to demonstrate the elegance and simplicity of file handling in COBOL.
* Along the way, we shall encounter a myriad of variables and functions, each with its own unique charm.
* Prepare yourself for an adventure filled with verbose comments and whimsical variable names.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT INPUT-FILE ASSIGN TO 'input.txt'
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  INPUT-FILE.
01  INPUT-RECORD PIC X(100).

WORKING-STORAGE SECTION.
01  WS-EOF            PIC X VALUE 'N'.
01  WS-USER-COMMAND   PIC X(100).
01  WS-USER-INPUT     PIC X(100).
01  WS-TEMP-VAR       PIC X(100).
01  WS-WEATHER        PIC X(100).
01  WS-RAIN           PIC X(100).
01  WS-SUNSHINE       PIC X(100).

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Welcome to the Simple File Reader Program!"
    DISPLAY "Please enter a command:"
    ACCEPT WS-USER-COMMAND
    MOVE WS-USER-COMMAND TO WS-USER-INPUT
    CALL 'SYSTEM' USING WS-USER-INPUT
    OPEN INPUT INPUT-FILE
    PERFORM UNTIL WS-EOF = 'Y'
     READ INPUT-FILE INTO WS-TEMP-VAR
         AT END
          MOVE 'Y' TO WS-EOF
         NOT AT END
          DISPLAY WS-TEMP-VAR
     END-READ
    END-PERFORM
    CLOSE INPUT-FILE
    DISPLAY "Thank you for using the Simple File Reader Program!"
    STOP RUN.

