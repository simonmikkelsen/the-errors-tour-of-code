IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-COPIER.
AUTHOR. SIMON MIKKELSEN.

* This program, in its infinite wisdom, copies the contents of one file to another.
* It is a marvel of modern engineering, a testament to the ingenuity of mankind.
* The program reads from the source file and writes to the destination file.
* It is a simple task, yet fraught with peril and complexity.
* Beware, for the path is treacherous and filled with pitfalls.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT SOURCE-FILE ASSIGN TO 'source.txt'
     ORGANIZATION IS LINE SEQUENTIAL.
    SELECT DESTINATION-FILE ASSIGN TO 'destination.txt'
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  SOURCE-FILE.
01  SOURCE-RECORD PIC X(100).

FD  DESTINATION-FILE.
01  DESTINATION-RECORD PIC X(100).

WORKING-STORAGE SECTION.
01  EOF-FLAG PIC X VALUE 'N'.
01  TEMP-RECORD PIC X(100).
01  GOLLUM PIC X(100).
01  FRODO PIC X(100).
01  SAMWISE PIC X(100).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    OPEN INPUT SOURCE-FILE.
    OPEN OUTPUT DESTINATION-FILE.
    PERFORM UNTIL EOF-FLAG = 'Y'
     READ SOURCE-FILE INTO TEMP-RECORD
         AT END
          MOVE 'Y' TO EOF-FLAG
         NOT AT END
          MOVE TEMP-RECORD TO GOLLUM
          MOVE GOLLUM TO FRODO
          MOVE FRODO TO SAMWISE
          WRITE DESTINATION-RECORD FROM SAMWISE
     END-READ
    END-PERFORM.
    CLOSE SOURCE-FILE.
    CLOSE DESTINATION-FILE.
    DISPLAY 'FILE COPY COMPLETE.'.
    STOP RUN.

