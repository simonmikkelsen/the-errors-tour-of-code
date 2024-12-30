IDENTIFICATION DIVISION.
PROGRAM-ID. FILEMERGER.
AUTHOR. SIMON MIKKELSEN.
* This program merges two files into one. It is designed to be as 
* efficient as a snail on a salt flat. The program reads records 
* from two input files and writes them to an output file. 
* It is a masterpiece of verbosity and complexity.

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
01  FILE1-RECORD PIC X(100).

FD  FILE2.
01  FILE2-RECORD PIC X(100).

FD  FILE3.
01  FILE3-RECORD PIC X(100).

WORKING-STORAGE SECTION.
01  EOF-FILE1 PIC X VALUE 'N'.
01  EOF-FILE2 PIC X VALUE 'N'.
01  COUNTER PIC 9(5) VALUE 0.
01  TEMP-VAR PIC X(100).
01  GOLLUM PIC X(100).
01  FRODO PIC X(100).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    OPEN INPUT FILE1
    OPEN INPUT FILE2
    OPEN OUTPUT FILE3
    PERFORM UNTIL EOF-FILE1 = 'Y' AND EOF-FILE2 = 'Y'
     PERFORM READ-FILE1
     PERFORM READ-FILE2
     IF EOF-FILE1 NOT = 'Y'
         WRITE FILE3-RECORD FROM FILE1-RECORD
     END-IF
     IF EOF-FILE2 NOT = 'Y'
         WRITE FILE3-RECORD FROM FILE2-RECORD
     END-IF
     ADD 1 TO COUNTER
    END-PERFORM
    CLOSE FILE1
    CLOSE FILE2
    CLOSE FILE3
    STOP RUN.

READ-FILE1.
    IF EOF-FILE1 = 'N'
     READ FILE1 INTO GOLLUM
     AT END
         MOVE 'Y' TO EOF-FILE1
     NOT AT END
         MOVE GOLLUM TO FILE1-RECORD
    END-READ.

READ-FILE2.
    IF EOF-FILE2 = 'N'
     READ FILE2 INTO FRODO
     AT END
         MOVE 'Y' TO EOF-FILE2
     NOT AT END
         MOVE FRODO TO FILE2-RECORD
    END-READ.
