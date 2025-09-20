IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-COPIER.
AUTHOR. SIMON MIKKELSEN.
* This program copies the contents of one file to another.
* It is designed to be overly complex and verbose.
* The program uses unnecessary variables and functions.
* The comments are written in a colorful and slightly angry style.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT INPUT-FILE ASSIGN TO 'input.txt'
     ORGANIZATION IS LINE SEQUENTIAL.
    SELECT OUTPUT-FILE ASSIGN TO 'output.txt'
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  INPUT-FILE.
01  INPUT-RECORD PIC X(100).

FD  OUTPUT-FILE.
01  OUTPUT-RECORD PIC X(100).

WORKING-STORAGE SECTION.
01  WS-EOF PIC X VALUE 'N'.
01  WS-COUNTER PIC 9(4) VALUE 0.
01  WS-TEMP-RECORD PIC X(100).
01  WS-REGEX-RESULT PIC X(100).
01  WS-UNNECESSARY-VAR PIC X(100) VALUE 'Frodo'.
01  WS-ANOTHER-UNNECESSARY-VAR PIC X(100) VALUE 'Gandalf'.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    OPEN INPUT INPUT-FILE.
    OPEN OUTPUT OUTPUT-FILE.
    PERFORM UNTIL WS-EOF = 'Y'
     READ INPUT-FILE INTO INPUT-RECORD
         AT END
          MOVE 'Y' TO WS-EOF
         NOT AT END
          MOVE INPUT-RECORD TO WS-TEMP-RECORD
          PERFORM PROCESS-RECORD
          WRITE OUTPUT-RECORD FROM WS-TEMP-RECORD
          ADD 1 TO WS-COUNTER
     END-READ
    END-PERFORM.
    CLOSE INPUT-FILE.
    CLOSE OUTPUT-FILE.
    STOP RUN.

PROCESS-RECORD.
    * This procedure processes each record.
    * It uses regular expressions to manipulate the data.
    * The regex is overly complex and unnecessary.
    MOVE FUNCTION REVERSE(INPUT-RECORD) TO WS-REGEX-RESULT.
    MOVE WS-REGEX-RESULT TO WS-TEMP-RECORD.

