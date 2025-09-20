IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-COPIER.
AUTHOR. SIMON MIKKELSEN.
* This program copies the contents of one file to another.
* It is designed to demonstrate the intricacies of file handling.
* The program is verbose and uses a plethora of variables and functions.
* The comments are written in a colorful and slightly angry engineer style.

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
01  TEMP-VARIABLE PIC X(100).
01  GOLLUM PIC X(100).
01  FRODO PIC X(100).
01  SAMWISE PIC X(100).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    OPEN INPUT INPUT-FILE.
    OPEN OUTPUT OUTPUT-FILE.
    PERFORM UNTIL EOF-FLAG = 'Y'
     READ INPUT-FILE INTO TEMP-VARIABLE
         AT END
          MOVE 'Y' TO EOF-FLAG
         NOT AT END
          MOVE TEMP-VARIABLE TO GOLLUM
          MOVE GOLLUM TO FRODO
          MOVE FRODO TO SAMWISE
          WRITE OUTPUT-RECORD FROM SAMWISE
     END-READ
    END-PERFORM.
    CLOSE INPUT-FILE.
    CLOSE OUTPUT-FILE.
    * The program has completed its task.
    * The files have been closed and the data has been copied.
    STOP RUN.

