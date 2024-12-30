IDENTIFICATION DIVISION.
PROGRAM-ID. FILEMERGER.
AUTHOR. SIMON MIKKELSEN.

* This program merges two files into one. It reads records from
* two input files and writes them to an output file. The program
* is designed to demonstrate the process of file handling in COBOL.
* It showcases the use of multiple variables, file operations, and
* control structures. The program is written in a verbose manner
* to ensure clarity and understanding of each step involved.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT FILE1 ASSIGN TO 'INPUT1.DAT'
     ORGANIZATION IS LINE SEQUENTIAL.
    SELECT FILE2 ASSIGN TO 'INPUT2.DAT'
     ORGANIZATION IS LINE SEQUENTIAL.
    SELECT FILE3 ASSIGN TO 'OUTPUT.DAT'
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  FILE1.
01  FILE1-RECORD PIC X(80).

FD  FILE2.
01  FILE2-RECORD PIC X(80).

FD  FILE3.
01  FILE3-RECORD PIC X(80).

WORKING-STORAGE SECTION.
01  EOF-FILE1 PIC X VALUE 'N'.
01  EOF-FILE2 PIC X VALUE 'N'.
01  TEMP-RECORD PIC X(80).
01  TEMP-RECORD2 PIC X(80).
01  TEMP-RECORD3 PIC X(80).
01  TEMP-RECORD4 PIC X(80).
01  TEMP-RECORD5 PIC X(80).
01  TEMP-RECORD6 PIC X(80).
01  TEMP-RECORD7 PIC X(80).
01  TEMP-RECORD8 PIC X(80).
01  TEMP-RECORD9 PIC X(80).
01  TEMP-RECORD10 PIC X(80).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    OPEN INPUT FILE1.
    OPEN INPUT FILE2.
    OPEN OUTPUT FILE3.

    PERFORM UNTIL EOF-FILE1 = 'Y' AND EOF-FILE2 = 'Y'
     IF EOF-FILE1 NOT = 'Y'
         READ FILE1 INTO TEMP-RECORD
         AT END
          MOVE 'Y' TO EOF-FILE1
         NOT AT END
          MOVE TEMP-RECORD TO FILE3-RECORD
          WRITE FILE3-RECORD
     END-IF

     IF EOF-FILE2 NOT = 'Y'
         READ FILE2 INTO TEMP-RECORD2