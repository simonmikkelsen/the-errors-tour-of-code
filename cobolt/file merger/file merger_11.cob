IDENTIFICATION DIVISION.
PROGRAM-ID. FILEMERGER.
AUTHOR. SIMON MIKKELSEN.

* This program merges two files into one. It reads records from
* two input files and writes them to an output file. The program
* is designed to demonstrate the use of COBOL for file handling
* operations. It showcases the power of COBOL in handling large
* volumes of data with ease and efficiency. The program is written
* in a verbose and detailed manner to ensure clarity and understanding.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT INPUT-FILE-1 ASSIGN TO 'INPUT1.DAT'
     ORGANIZATION IS LINE SEQUENTIAL.
    SELECT INPUT-FILE-2 ASSIGN TO 'INPUT2.DAT'
     ORGANIZATION IS LINE SEQUENTIAL.
    SELECT OUTPUT-FILE ASSIGN TO 'OUTPUT.DAT'
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  INPUT-FILE-1.
01  INPUT-RECORD-1 PIC X(100).

FD  INPUT-FILE-2.
01  INPUT-RECORD-2 PIC X(100).

FD  OUTPUT-FILE.
01  OUTPUT-RECORD PIC X(100).

WORKING-STORAGE SECTION.
01  EOF-FLAG-1      PIC X VALUE 'N'.
01  EOF-FLAG-2      PIC X VALUE 'N'.
01  TEMP-RECORD     PIC X(100).
01  GOLLUM          PIC X(100).
01  FRODO           PIC X(100).
01  SAMWISE         PIC X(100).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    OPEN INPUT INPUT-FILE-1
    OPEN INPUT INPUT-FILE-2
    OPEN OUTPUT OUTPUT-FILE

    PERFORM UNTIL EOF-FLAG-1 = 'Y' AND EOF-FLAG-2 = 'Y'
     IF EOF-FLAG-1 NOT = 'Y'
         READ INPUT-FILE-1 INTO INPUT-RECORD-1
         AT END
          MOVE 'Y' TO EOF-FLAG-1
         NOT AT END
          MOVE INPUT-RECORD-1 TO TEMP-RECORD
          MOVE TEMP-RECORD TO OUTPUT-RECORD
          WRITE OUTPUT-RECORD
     END-IF

     IF EOF-FLAG-2 NOT = 'Y'
         READ INPUT-FILE-2 INTO INPUT-RECORD-2
         AT END
          MOVE 'Y' TO EOF-FLAG-2
         NOT AT END
          MOVE INPUT-RECORD-2 TO TEMP-RECORD
          MOVE TEMP-RECORD TO OUTPUT-RECORD
          WRITE OUTPUT-RECORD
     END-IF
    END-PERFORM

    CLOSE INPUT-FILE-1
    CLOSE INPUT-FILE-2
    CLOSE OUTPUT-FILE

    STOP RUN.

