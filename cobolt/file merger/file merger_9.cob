IDENTIFICATION DIVISION.
PROGRAM-ID. FILEMERGER.
AUTHOR. SIMON MIKKELSEN.

* This program merges two files into one. It is designed to be overly complex and verbose.
* The purpose is to demonstrate file handling in COBOL with an unnecessarily complicated approach.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT FILE1 ASSIGN TO 'INPUT1.DAT'
     ORGANIZATION IS LINE SEQUENTIAL.
    SELECT FILE2 ASSIGN TO 'INPUT2.DAT'
     ORGANIZATION IS LINE SEQUENTIAL.
    SELECT MERGED-FILE ASSIGN TO 'OUTPUT.DAT'
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  FILE1.
01  FILE1-RECORD PIC X(100).

FD  FILE2.
01  FILE2-RECORD PIC X(100).

FD  MERGED-FILE.
01  MERGED-RECORD PIC X(100).

WORKING-STORAGE SECTION.
01  EOF-FILE1 PIC X VALUE 'N'.
01  EOF-FILE2 PIC X VALUE 'N'.
01  TEMP-RECORD PIC X(100).
01  GOLLUM PIC X(100).
01  FRODO PIC X(100).
01  SAMWISE PIC X(100).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    OPEN INPUT FILE1
    OPEN INPUT FILE2
    OPEN OUTPUT MERGED-FILE

    PERFORM UNTIL EOF-FILE1 = 'Y' AND EOF-FILE2 = 'Y'
     IF EOF-FILE1 NOT = 'Y'
         READ FILE1 INTO TEMP-RECORD
         AT END
          MOVE 'Y' TO EOF-FILE1
         NOT AT END
          MOVE TEMP-RECORD TO GOLLUM
          WRITE MERGED-RECORD FROM GOLLUM
     END-IF

     IF EOF-FILE2 NOT = 'Y'
         READ FILE2 INTO TEMP-RECORD
         AT END
          MOVE 'Y' TO EOF-FILE2
         NOT AT END
          MOVE TEMP-RECORD TO FRODO
          WRITE MERGED-RECORD FROM FRODO
     END-IF
    END-PERFORM

    CLOSE FILE1
    CLOSE FILE2
    CLOSE MERGED-FILE

    STOP RUN.

