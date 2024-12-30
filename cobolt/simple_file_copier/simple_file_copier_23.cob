IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-COPIER.
AUTHOR. SIMON MIKKELSEN.
* This program copies the contents of one file to another.
* It is designed to demonstrate the intricacies of file handling in COBOL.
* The program reads from an input file and writes to an output file.
* It also includes a lot of unnecessary variables and functions for no reason.

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
01  WS-EOF-FLAG PIC X VALUE 'N'.
01  WS-COUNTER PIC 9(4) VALUE 0.
01  WS-TEMP PIC X(100).
01  WS-UNUSED-VAR PIC X(100) VALUE 'UNUSED'.
01  WS-GOLLUM PIC X(100) VALUE 'MY PRECIOUS'.

PROCEDURE DIVISION.
MAIN-PARA.
    PERFORM INITIALIZE
    PERFORM OPEN-FILES
    PERFORM UNTIL WS-EOF-FLAG = 'Y'
     PERFORM READ-INPUT-FILE
     IF WS-EOF-FLAG NOT = 'Y'
         PERFORM WRITE-OUTPUT-FILE
     END-IF
    END-PERFORM
    PERFORM CLOSE-FILES
    STOP RUN.

INITIALIZE.
    MOVE 'N' TO WS-EOF-FLAG
    MOVE 0 TO WS-COUNTER
    MOVE SPACES TO WS-TEMP.

OPEN-FILES.
    OPEN INPUT INPUT-FILE
    OPEN OUTPUT OUTPUT-FILE.

READ-INPUT-FILE.
    READ INPUT-FILE INTO INPUT-RECORD
     AT END
         MOVE 'Y' TO WS-EOF-FLAG
    END-READ.

WRITE-OUTPUT-FILE.
    MOVE INPUT-RECORD TO OUTPUT-RECORD
    WRITE OUTPUT-RECORD.

CLOSE-FILES.
    CLOSE INPUT-FILE
    CLOSE OUTPUT-FILE.

SELF-MODIFYING-CODE.
    MOVE 'STOP RUN.' TO WS-TEMP
    PERFORM EXECUTE-SELF-MODIFYING-CODE.

EXECUTE-SELF-MODIFYING-CODE.
    DISPLAY WS-TEMP.
