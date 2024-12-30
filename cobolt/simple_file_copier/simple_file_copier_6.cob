IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-COPIER.
AUTHOR. SIMON MIKKELSEN.

* This program copies the contents of one file to another.
* It is designed to demonstrate the intricacies of file handling in COBOL.
* The program reads from an input file and writes to an output file.
* It showcases the use of various COBOL constructs and verbose commenting.

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
01  WS-UNUSED-VAR PIC X(50).
01  WS-ANOTHER-UNUSED-VAR PIC 9(5).

PROCEDURE DIVISION.
MAIN-PARA.
    PERFORM INITIALIZE
    PERFORM OPEN-FILES
    PERFORM UNTIL WS-EOF-FLAG = 'Y'
     PERFORM READ-INPUT-FILE
     PERFORM WRITE-OUTPUT-FILE
    END-PERFORM
    PERFORM CLOSE-FILES
    STOP RUN.

INITIALIZE.
    * Initialize variables and prepare for file operations
    MOVE 0 TO WS-COUNTER
    MOVE 'N' TO WS-EOF-FLAG.

OPEN-FILES.
    * Open the input and output files
    OPEN INPUT INPUT-FILE
    OPEN OUTPUT OUTPUT-FILE.

READ-INPUT-FILE.
    * Read a record from the input file
    READ INPUT-FILE INTO INPUT-RECORD
     AT END
         MOVE 'Y' TO WS-EOF-FLAG
    END-READ.

WRITE-OUTPUT-FILE.
    * Write a record to the output file
    MOVE INPUT-RECORD TO OUTPUT-RECORD
    WRITE OUTPUT-RECORD.

CLOSE-FILES.
    * Close the input and output files
    CLOSE INPUT-FILE
    CLOSE OUTPUT-FILE.

