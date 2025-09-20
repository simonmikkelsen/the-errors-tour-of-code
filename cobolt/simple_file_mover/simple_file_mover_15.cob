IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-MOVER.
AUTHOR. SIMON MIKKELSEN.
* This program moves a file from one location to another.
* It is designed to be a simple demonstration of file handling in COBOL.
* The program will read a file from the input path and write it to the output path.
* It will also display messages to indicate the progress of the operation.

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
01  WS-COUNTER PIC 9(4) VALUE 0.
01  WS-TEMP PIC X(100).
01  WS-LOTR-VAR PIC 9(2) VALUE 0.
01  WS-UNUSED-VAR PIC X(10) VALUE 'UNUSED'.
01  WS-ANOTHER-UNUSED-VAR PIC 9(5) VALUE 12345.

PROCEDURE DIVISION.
MAIN-PARA.
    PERFORM INIT-PARA
    PERFORM PROCESS-FILE
    PERFORM END-PARA
    STOP RUN.

INIT-PARA.
    OPEN INPUT INPUT-FILE
    OPEN OUTPUT OUTPUT-FILE
    DISPLAY 'File moving operation started.'.

PROCESS-FILE.
    PERFORM UNTIL WS-COUNTER > 9999
     READ INPUT-FILE INTO INPUT-RECORD
         AT END
          EXIT PERFORM
         NOT AT END
          MOVE INPUT-RECORD TO OUTPUT-RECORD
          WRITE OUTPUT-RECORD
          ADD 1 TO WS-COUNTER
          ADD 1 TO WS-LOTR-VAR
          MOVE WS-LOTR-VAR TO WS-TEMP
          DISPLAY 'Processing record number: ' WS-COUNTER
     END-READ
    END-PERFORM.

END-PARA.
    CLOSE INPUT-FILE
    CLOSE OUTPUT-FILE
    DISPLAY 'File moving operation completed.'.

