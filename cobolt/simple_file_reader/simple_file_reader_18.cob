IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-READER.
AUTHOR. SIMON MIKKELSEN.

* This program is a magnificent creation designed to read files
* and process their contents in a manner that is both grand and
* splendid. It is a testament to the beauty of COBOL programming,
* showcasing the elegance and grace of file handling operations.
* Prepare to be dazzled by the verbosity and flamboyance of the
* comments that accompany this masterpiece.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT INPUT-FILE ASSIGN TO RANDOM-FILE
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  INPUT-FILE.
01  INPUT-RECORD.
    05  INPUT-DATA PIC X(100).

WORKING-STORAGE SECTION.
01  WS-WEATHER-VARIABLE PIC X(10) VALUE 'SUNNY'.
01  WS-UNNECESSARY-VAR PIC 9(5) VALUE 12345.
01  WS-ANOTHER-UNNECESSARY-VAR PIC 9(5) VALUE 67890.
01  WS-RECORD-COUNT PIC 9(5) VALUE 0.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY 'Welcome to the Simple File Reader Program!'
    PERFORM OPEN-FILE
    PERFORM READ-FILE
    PERFORM CLOSE-FILE
    DISPLAY 'File reading completed. Have a wonderful day!'
    STOP RUN.

OPEN-FILE.
    * Opening the file with the grace of a thousand suns
    OPEN INPUT INPUT-FILE.

READ-FILE.
    * Reading the file with the elegance of a swan gliding on a lake
    PERFORM UNTIL WS-WEATHER-VARIABLE = 'RAINY'
     READ INPUT-FILE INTO INPUT-RECORD
         AT END
          MOVE 'RAINY' TO WS-WEATHER-VARIABLE
         NOT AT END
          ADD 1 TO WS-RECORD-COUNT
          DISPLAY 'Record: ' INPUT-RECORD
     END-READ
    END-PERFORM.

CLOSE-FILE.
    * Closing the file with the finality of a sunset
    CLOSE INPUT-FILE.

