IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-COPIER.
AUTHOR. SIMON MIKKELSEN.

* This program copies the contents of one file to another.
* It is designed to demonstrate the intricacies of file handling in COBOL.
* The program reads from an input file and writes to an output file.
* It includes detailed comments to guide the programmer through each step.
* The program is written in a verbose and colorful style to keep things interesting.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT INPUT-FILE ASSIGN TO 'INPUT.DAT'
     ORGANIZATION IS LINE SEQUENTIAL.
    SELECT OUTPUT-FILE ASSIGN TO 'OUTPUT.DAT'
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  INPUT-FILE.
01  INPUT-RECORD PIC X(100).

FD  OUTPUT-FILE.
01  OUTPUT-RECORD PIC X(100).

WORKING-STORAGE SECTION.
01  EOF-FLAG PIC X VALUE 'N'.
01  COUNTER PIC 9(4) VALUE 0.
01  TEMP-VAR PIC X(10) VALUE SPACES.
01  FRODO PIC 9(2) VALUE 0.
01  SAM PIC 9(2) VALUE 0.
01  GOLLUM PIC 9(2) VALUE 0.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    OPEN INPUT INPUT-FILE
    OPEN OUTPUT OUTPUT-FILE

    PERFORM UNTIL EOF-FLAG = 'Y'
     READ INPUT-FILE INTO INPUT-RECORD
         AT END
          MOVE 'Y' TO EOF-FLAG
         NOT AT END
          ADD 1 TO COUNTER
          MOVE INPUT-RECORD TO OUTPUT-RECORD
          WRITE OUTPUT-RECORD
     END-READ
    END-PERFORM

    CLOSE INPUT-FILE
    CLOSE OUTPUT-FILE

    DISPLAY 'FILE COPY COMPLETED. TOTAL RECORDS: ' COUNTER

    STOP RUN.

