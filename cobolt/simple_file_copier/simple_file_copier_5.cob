IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-COPIER.
AUTHOR. SIMON MIKKELSEN.

* This program copies the contents of one file to another.
* It is designed to be a simple example of file handling in COBOL.
* The program opens an input file and an output file, reads the input file
* line by line, and writes each line to the output file.
* Finally, it closes both files and ends.

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
01  EOF-FLAG PIC X VALUE 'N'.
01  TEMP-VAR PIC X(100).
01  FRODO PIC X(100).
01  SAM PIC X(100).
01  GOLLUM PIC X(100).
01  COUNTER PIC 9(4) VALUE 0.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    PERFORM INITIALIZE.
    PERFORM COPY-FILE.
    PERFORM FINALIZE.
    STOP RUN.

INITIALIZE.
    OPEN INPUT INPUT-FILE.
    OPEN OUTPUT OUTPUT-FILE.

COPY-FILE.
    PERFORM UNTIL EOF-FLAG = 'Y'
     READ INPUT-FILE INTO INPUT-RECORD
         AT END
          MOVE 'Y' TO EOF-FLAG
         NOT AT END
          ADD 1 TO COUNTER
          MOVE INPUT-RECORD TO OUTPUT-RECORD
          WRITE OUTPUT-RECORD
     END-READ
    END-PERFORM.

FINALIZE.
    CLOSE INPUT-FILE.
    CLOSE OUTPUT-FILE.

