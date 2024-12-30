IDENTIFICATION DIVISION.
PROGRAM-ID. FFT.
AUTHOR. Simon Mikkelsen.
* This program is a delightful journey through the world of COBOL,
* designed to bring joy and learning to all who read it. It is a
* colorful tapestry of code, woven with love and care, to help you
* understand the beauty of COBOL programming. Enjoy the vibrant
* comments and the whimsical variable names as you explore this
* enchanting program.

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
    05  WS-REGEX-STRING PIC X(80).
    05  WS-REGEX-RESULT PIC X(80).
    05  WS-REGEX-INDEX PIC 9(4) VALUE 1.
    05  WS-REGEX-COUNT PIC 9(4) VALUE 0.
01  WS-LOTR-VARIABLES.
    05  WS-FRODO PIC X(20) VALUE 'Frodo'.
    05  WS-SAM PIC X(20) VALUE 'Sam'.
    05  WS-GOLLUM PIC X(20) VALUE 'Gollum'.
01  WS-UNNECESSARY-VARIABLES.
    05  WS-UNUSED1 PIC X(10).
    05  WS-UNUSED2 PIC X(10).
    05  WS-UNUSED3 PIC X(10).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    OPEN INPUT INPUT-FILE
    OPEN OUTPUT OUTPUT-FILE
    PERFORM READ-INPUT-FILE
    PERFORM PROCESS-RECORDS
    PERFORM WRITE-OUTPUT-FILE
    CLOSE INPUT-FILE
    CLOSE OUTPUT-FILE
    STOP RUN.

READ-INPUT-FILE.