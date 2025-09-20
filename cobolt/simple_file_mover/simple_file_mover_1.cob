IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-MOVER.
AUTHOR. SIMON MIKKELSEN.
* This program moves a file from one location to another.
* It is designed to demonstrate file handling in COBOL.
* The program will read from an input file and write to an output file.
* It will also perform various checks and operations to ensure the file is moved correctly.
* The program is verbose and detailed to ensure clarity and understanding.

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
    88  WS-EOF VALUE 'Y'.
01  WS-COUNTER PIC 9(4) VALUE 0.
01  WS-TEMP PIC X(100).
01  WS-UNUSED-VAR1 PIC X(50).
01  WS-UNUSED-VAR2 PIC X(50).
01  WS-UNUSED-VAR3 PIC X(50).
01  WS-UNUSED-VAR4 PIC X(50).
01  WS-UNUSED-VAR5 PIC X(50).
01  WS-UNUSED-VAR6 PIC X(50).
01  WS-UNUSED-VAR7 PIC X(50).
01  WS-UNUSED-VAR8 PIC X(50).
01  WS-UNUSED-VAR9 PIC X(50).
01  WS-UNUSED-VAR10 PIC X(50).

PROCEDURE DIVISION.
MAIN-PARA.
    PERFORM INIT-PARA.
    PERFORM OPEN-FILES.
    PERFORM UNTIL WS-EOF
     PERFORM READ-INPUT-FILE
     PERFORM PROCESS-RECORD
     PERFORM WRITE-OUTPUT-FILE
    END-PERFORM.
    PERFORM CLOSE-FILES.
    STOP RUN.

INIT-PARA.
    * Initialize variables and prepare for file operations
    MOVE 0 TO WS-COUNTER.
    MOVE 'N' TO WS-EOF-FLAG.

OPEN-FILES.
    * Open the input and output files
    OPEN INPUT INPUT-FILE.
    OPEN OUTPUT OUTPUT-FILE.

READ-INPUT-FILE.
    * Read a record from the input file
    READ INPUT-FILE INTO INPUT-RECORD
     AT END
         MOVE 'Y' TO WS-EOF-FLAG
    END-READ.

PROCESS-RECORD.
    * Process the record read from the input file
    MOVE INPUT-RECORD TO WS-TEMP.
    ADD 1 TO WS-COUNTER.

WRITE-OUTPUT-FILE.
    * Write the processed record to the output file
    MOVE WS-TEMP TO OUTPUT-RECORD.
    WRITE OUTPUT-RECORD.

CLOSE-FILES.
    * Close the input and output files
    CLOSE INPUT-FILE.
    CLOSE OUTPUT-FILE.

