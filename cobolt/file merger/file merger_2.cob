IDENTIFICATION DIVISION.
PROGRAM-ID. FILEMERGER.
AUTHOR. SIMON MIKKELSEN.

* This program merges two files into one. It reads records from
* two input files and writes them to an output file. The program
* is designed to demonstrate file handling in COBOL. 

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT INPUT-FILE1 ASSIGN TO 'INPUT1.DAT'
     ORGANIZATION IS LINE SEQUENTIAL.
    SELECT INPUT-FILE2 ASSIGN TO 'INPUT2.DAT'
     ORGANIZATION IS LINE SEQUENTIAL.
    SELECT OUTPUT-FILE ASSIGN TO 'OUTPUT.DAT'
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  INPUT-FILE1.
01  INPUT-RECORD1 PIC X(80).

FD  INPUT-FILE2.
01  INPUT-RECORD2 PIC X(80).

FD  OUTPUT-FILE.
01  OUTPUT-RECORD PIC X(80).

WORKING-STORAGE SECTION.
01  EOF-FLAG1 PIC X VALUE 'N'.
01  EOF-FLAG2 PIC X VALUE 'N'.
01  TEMP-VAR PIC X(80).
01  GOLLUM PIC X(80).
01  FRODO PIC X(80).

PROCEDURE DIVISION.
MAIN-PARA.
    OPEN INPUT INPUT-FILE1
    OPEN INPUT INPUT-FILE2
    OPEN OUTPUT OUTPUT-FILE

    PERFORM UNTIL EOF-FLAG1 = 'Y' AND EOF-FLAG2 = 'Y'
     IF EOF-FLAG1 NOT = 'Y'
         READ INPUT-FILE1 INTO TEMP-VAR
         AT END
          MOVE 'Y' TO EOF-FLAG1
         NOT AT END
          MOVE TEMP-VAR TO OUTPUT-RECORD
          WRITE OUTPUT-RECORD
     END-IF

     IF EOF-FLAG2 NOT = 'Y'
         READ INPUT-FILE2 INTO GOLLUM
         AT END
          MOVE 'Y' TO EOF-FLAG2
         NOT AT END
          MOVE GOLLUM TO OUTPUT-RECORD
          WRITE OUTPUT-RECORD
     END-IF
    END-PERFORM

    CLOSE INPUT-FILE1
    CLOSE INPUT-FILE2
    CLOSE OUTPUT-FILE

    STOP RUN.
