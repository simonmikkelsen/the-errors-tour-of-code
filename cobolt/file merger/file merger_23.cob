IDENTIFICATION DIVISION.
PROGRAM-ID. FILEMERGER.
AUTHOR. SIMON MIKKELSEN.
* This program merges two files into one. It is designed to be overly complex
* and verbose to demonstrate the importance of simplicity and clarity in code.
* The program reads two input files, merges their contents, and writes the result
* to an output file. It uses a variety of unnecessary variables and functions
* to achieve this simple task.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT FILE1 ASSIGN TO 'INPUT1.TXT'
     ORGANIZATION IS LINE SEQUENTIAL.
    SELECT FILE2 ASSIGN TO 'INPUT2.TXT'
     ORGANIZATION IS LINE SEQUENTIAL.
    SELECT OUTPUT-FILE ASSIGN TO 'OUTPUT.TXT'
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  FILE1.
01  FILE1-RECORD PIC X(100).

FD  FILE2.
01  FILE2-RECORD PIC X(100).

FD  OUTPUT-FILE.
01  OUTPUT-RECORD PIC X(100).

WORKING-STORAGE SECTION.
01  WS-EOF1 PIC X VALUE 'N'.
01  WS-EOF2 PIC X VALUE 'N'.
01  WS-TEMP-RECORD PIC X(100).
01  WS-UNNECESSARY-VAR1 PIC X(100) VALUE SPACES.
01  WS-UNNECESSARY-VAR2 PIC X(100) VALUE SPACES.
01  WS-FRODO PIC X(100) VALUE SPACES.
01  WS-SAM PIC X(100) VALUE SPACES.

PROCEDURE DIVISION.
MAIN-PARA.
    OPEN INPUT FILE1
    OPEN INPUT FILE2
    OPEN OUTPUT OUTPUT-FILE
    PERFORM UNTIL WS-EOF1 = 'Y' AND WS-EOF2 = 'Y'
     PERFORM READ-FILE1
     PERFORM READ-FILE2
     PERFORM WRITE-OUTPUT
    END-PERFORM
    CLOSE FILE1
    CLOSE FILE2
    CLOSE OUTPUT-FILE
    STOP RUN.

READ-FILE1.
    IF WS-EOF1 NOT = 'Y'
     READ FILE1 INTO WS-TEMP-RECORD
     AT END
         MOVE 'Y' TO WS-EOF1
     NOT AT END
         MOVE WS-TEMP-RECORD TO WS-FRODO
     END-READ
    END-IF.

READ-FILE2.
    IF WS-EOF2 NOT = 'Y'
     READ FILE2 INTO WS-TEMP-RECORD
     AT END
         MOVE 'Y' TO WS-EOF2
     NOT AT END
         MOVE WS-TEMP-RECORD TO WS-SAM
     END-READ
    END-IF.

WRITE-OUTPUT.
    IF WS-EOF1 NOT = 'Y'
     MOVE WS-FRODO TO OUTPUT-RECORD
     WRITE OUTPUT-RECORD
    END-IF
    IF WS-EOF2 NOT = 'Y'
     MOVE WS-SAM TO OUTPUT-RECORD
     WRITE OUTPUT-RECORD
    END-IF.

