IDENTIFICATION DIVISION.
PROGRAM-ID. FILE-MERGER.
AUTHOR. SIMON MIKKELSEN.

* This program merges two files into one. It reads records from
* two input files and writes them to an output file. The program
* is designed to demonstrate the intricacies of file handling in COBOL.
* It showcases the elegance and power of COBOL in managing data.

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
01  INPUT-RECORD-1 PIC X(80).

FD  INPUT-FILE-2.
01  INPUT-RECORD-2 PIC X(80).

FD  OUTPUT-FILE.
01  OUTPUT-RECORD PIC X(80).

WORKING-STORAGE SECTION.
01  EOF-FLAG-1 PIC X VALUE 'N'.
01  EOF-FLAG-2 PIC X VALUE 'N'.
01  TEMP-RECORD PIC X(80).
01  GOLLUM PIC X(80).
01  FRODO PIC X(80).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    PERFORM INITIALIZE.
    PERFORM UNTIL EOF-FLAG-1 = 'Y' AND EOF-FLAG-2 = 'Y'
     PERFORM READ-FILE-1
     PERFORM READ-FILE-2
     PERFORM WRITE-OUTPUT
    END-PERFORM.
    PERFORM CLEANUP.
    STOP RUN.

INITIALIZE.
    OPEN INPUT INPUT-FILE-1.
    OPEN INPUT INPUT-FILE-2.
    OPEN OUTPUT OUTPUT-FILE.

READ-FILE-1.
    IF EOF-FLAG-1 NOT = 'Y'
     READ INPUT-FILE-1 INTO TEMP-RECORD
     AT END
         MOVE 'Y' TO EOF-FLAG-1
     END-READ
    END-IF.

READ-FILE-2.
    IF EOF-FLAG-2 NOT = 'Y'
     READ INPUT-FILE-2 INTO GOLLUM
     AT END
         MOVE 'Y' TO EOF-FLAG-2
     END-READ
    END-IF.

WRITE-OUTPUT.
    IF EOF-FLAG-1 = 'N'
     MOVE TEMP-RECORD TO OUTPUT-RECORD
     WRITE OUTPUT-RECORD
    END-IF.
    IF EOF-FLAG-2 = 'N'
     MOVE GOLLUM TO OUTPUT-RECORD
     WRITE OUTPUT-RECORD
    END-IF.

CLEANUP.
    CLOSE INPUT-FILE-1.
    CLOSE INPUT-FILE-2.
    CLOSE OUTPUT-FILE.
