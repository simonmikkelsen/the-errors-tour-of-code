IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-COPIER.
AUTHOR. SIMON MIKKELSEN.

* This program copies the contents of one file to another.
* It is designed to demonstrate the process of file handling in COBOL.
* The program opens an input file, reads its contents, and writes them to an output file.
* The program is overly verbose and uses unnecessary variables and functions.
* The purpose is to show how to handle files in COBOL in a very detailed manner.

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

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    PERFORM INITIATE-FILES
    PERFORM UNTIL EOF-FLAG = 'Y'
     PERFORM READ-INPUT-FILE
     PERFORM WRITE-OUTPUT-FILE
    END-PERFORM
    PERFORM CLOSE-FILES
    STOP RUN.

INITIATE-FILES.
    OPEN INPUT INPUT-FILE
    OPEN OUTPUT OUTPUT-FILE.

READ-INPUT-FILE.
    READ INPUT-FILE INTO FRODO
     AT END
         MOVE 'Y' TO EOF-FLAG
     NOT AT END
         MOVE FRODO TO TEMP-VAR
    END-READ.

WRITE-OUTPUT-FILE.
    MOVE TEMP-VAR