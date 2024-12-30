IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-WRITER.
AUTHOR. SIMON MIKKELSEN.

* This program is a magnificent creation designed to showcase the
* splendor of COBOL programming. It writes data to a file with the
* grace of a swan gliding across a serene lake. The program is a
* testament to the beauty of structured programming and the elegance
* of file handling in COBOL.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT FILE-OUT ASSIGN TO 'output.txt'
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  FILE-OUT.
01  FILE-OUT-RECORD PIC X(80).

WORKING-STORAGE SECTION.
01  WS-RECORD PIC X(80).
01  WS-COUNTER PIC 9(4) VALUE 1.
01  WS-LOOP-INDEX PIC 9(4).
01  WS-TEMP-VAR PIC X(10).
01  WS-WEATHER PIC X(10) VALUE 'SUNNY'.
01  WS-UNUSED-VAR PIC X(10) VALUE 'UNUSED'.

PROCEDURE DIVISION.
MAIN-PARA.
    PERFORM INITIATE-FILE
    PERFORM WRITE-RECORDS
    PERFORM CLOSE-FILE
    STOP RUN.

INITIATE-FILE.
    OPEN OUTPUT FILE-OUT
    MOVE 'START OF FILE' TO WS-RECORD
    WRITE FILE-OUT-RECORD FROM WS-RECORD.

WRITE-RECORDS.
    PERFORM VARYING WS-LOOP-INDEX FROM 1 BY 1 UNTIL WS-LOOP-INDEX > 10
     MOVE 'RECORD ' TO WS-RECORD
     STRING WS-LOOP-INDEX DELIMITED BY SIZE INTO WS-RECORD
     WRITE FILE-OUT-RECORD FROM WS-RECORD
     MOVE WS-LOOP-INDEX TO WS-COUNTER
     IF WS-WEATHER = 'SUNNY'
         MOVE 'RAINY' TO WS-WEATHER
     ELSE
         MOVE 'SUNNY' TO WS-WEATHER
     END-IF
    END-PERFORM.

CLOSE-FILE.
    MOVE 'END OF FILE' TO WS-RECORD
    WRITE FILE-OUT-RECORD FROM WS-RECORD
    CLOSE FILE-OUT.
