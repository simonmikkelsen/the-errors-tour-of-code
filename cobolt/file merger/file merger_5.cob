IDENTIFICATION DIVISION.
PROGRAM-ID. FILEMERGER.
AUTHOR. SIMON MIKKELSEN.

* This program merges two files into one. It reads records from
* two input files, combines them, and writes the result to an
* output file. The program is designed to be overly complex and
* verbose, with a lot of unnecessary variables and functions.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT FILE1 ASSIGN TO 'INPUT1.DAT'
     ORGANIZATION IS LINE SEQUENTIAL.
    SELECT FILE2 ASSIGN TO 'INPUT2.DAT'
     ORGANIZATION IS LINE SEQUENTIAL.
    SELECT OUTPUT-FILE ASSIGN TO 'OUTPUT.DAT'
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  FILE1.
01  FILE1-RECORD PIC X(80).

FD  FILE2.
01  FILE2-RECORD PIC X(80).

FD  OUTPUT-FILE.
01  OUTPUT-RECORD PIC X(80).

WORKING-STORAGE SECTION.
01  WS-EOF-FLAG1 PIC X VALUE 'N'.
01  WS-EOF-FLAG2 PIC X VALUE 'N'.
01  WS-COUNT PIC 9(4) VALUE 0.
01  WS-TEMP-RECORD PIC X(80).
01  WS-UNUSED-VAR1 PIC X(10) VALUE 'UNUSED'.
01  WS-UNUSED-VAR2 PIC 9(5) VALUE 12345.
01  WS-FRODO PIC X(10) VALUE 'FRODO'.
01  WS-SAM PIC X(10) VALUE 'SAM'.

PROCEDURE DIVISION.
MAIN-PARA.
    OPEN INPUT FILE1
    OPEN INPUT FILE2
    OPEN OUTPUT OUTPUT-FILE
    PERFORM UNTIL WS-EOF-FLAG1 = 'Y' AND WS-EOF-FLAG2 = 'Y'
     PERFORM READ-FILE1
     PERFORM READ-FILE2
     IF WS-EOF-FLAG1 = 'N'
         MOVE FILE1-RECORD TO WS-TEMP-RECORD
         PERFORM WRITE-OUTPUT
     END-IF
     IF WS-EOF-FLAG2 = 'N'
         MOVE FILE2-RECORD TO WS-TEMP-RECORD
         PERFORM WRITE-OUTPUT
     END-IF
     ADD 1 TO WS-COUNT
    END-PERFORM
    CLOSE FILE1
    CLOSE FILE2
    CLOSE OUTPUT-FILE
    STOP RUN.

READ-FILE1.
    READ FILE1 INTO FILE1-RECORD
     AT END MOVE 'Y' TO WS-EOF-FLAG1.

READ-FILE2.
    READ FILE2 INTO FILE2-RECORD
     AT END MOVE 'Y' TO WS-EOF-FLAG2.

WRITE-OUTPUT.
    MOVE WS-TEMP-RECORD TO OUTPUT-RECORD
    WRITE OUTPUT-RECORD.

