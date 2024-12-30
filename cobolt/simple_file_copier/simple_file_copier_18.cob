IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-COPIER.
AUTHOR. SIMON MIKKELSEN.

* This program is designed to copy the contents of one file to another.
* It demonstrates basic file handling operations in COBOL.
* The program reads from an input file and writes to an output file.
* It is intended to be a simple example for new COBOL programmers.
* The program includes detailed comments to explain each step.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT INPUT-FILE ASSIGN TO "RANDOM.DAT"
     ORGANIZATION IS LINE SEQUENTIAL.
    SELECT OUTPUT-FILE ASSIGN TO "OUTPUT.DAT"
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

PROCEDURE DIVISION.
MAIN-PARA.
    OPEN INPUT INPUT-FILE
    OPEN OUTPUT OUTPUT-FILE

    PERFORM UNTIL EOF-FLAG = 'Y'
     READ INPUT-FILE INTO INPUT-RECORD
         AT END
          MOVE 'Y' TO EOF-FLAG
         NOT AT END
          MOVE INPUT-RECORD TO OUTPUT-RECORD
          WRITE OUTPUT-RECORD
     END-READ
    END-PERFORM

    CLOSE INPUT-FILE
    CLOSE OUTPUT-FILE

    STOP RUN.

