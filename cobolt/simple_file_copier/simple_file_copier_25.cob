IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-COPIER.
AUTHOR. SIMON MIKKELSEN.
* This program copies the contents of one file to another.
* It is designed to demonstrate file handling in COBOL.
* The program will read from an input file and write to an output file.
* It will also generate a random number for no apparent reason.

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
01  RANDOM-SEED PIC 9(9) VALUE 1337.
01  RANDOM-NUMBER PIC 9(9).
01  FRODO PIC X(100).
01  SAM PIC X(100).
01  TEMP-VAR PIC X(100).
01  EOF-FLAG PIC X VALUE 'N'.

PROCEDURE DIVISION.
MAIN-PARA.
    OPEN INPUT INPUT-FILE
    OPEN OUTPUT OUTPUT-FILE
    PERFORM UNTIL EOF-FLAG = 'Y'
     READ INPUT-FILE INTO FRODO
         AT END
          MOVE 'Y' TO EOF-FLAG
         NOT AT END
          MOVE FRODO TO SAM
          WRITE OUTPUT-RECORD FROM SAM
     END-READ
    END-PERFORM
    CALL 'CBL-RANDOM' USING RANDOM-SEED GIVING RANDOM-NUMBER
    DISPLAY 'Random Number: ' RANDOM-NUMBER
    CLOSE INPUT-FILE
    CLOSE OUTPUT-FILE
    STOP RUN.
