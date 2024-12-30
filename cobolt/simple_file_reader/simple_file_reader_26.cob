IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-READER.
AUTHOR. SIMON MIKKELSEN.

* This program is a delightful journey into the world of COBOL,
* where we shall embark on an adventure to read a file and
* process its contents with the utmost elegance and verbosity.
* Prepare yourself for a whirlwind of variables and functions,
* some of which may seem superfluous, but all contribute to the
* grandeur of this magnificent code.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT INPUT-FILE ASSIGN TO 'input.txt'
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  INPUT-FILE.
01  INPUT-RECORD PIC X(100).

WORKING-STORAGE SECTION.
01  WS-RANDOM-NUMBER PIC 9(5) VALUE 12345.
01  WS-RECORD-COUNT PIC 9(5) VALUE 0.
01  WS-TEMP-VAR PIC X(10).
01  WS-WEATHER-VAR PIC X(10).
01  WS-UNNECESSARY-VAR PIC X(10).
01  WS-ANOTHER-UNNECESSARY-VAR PIC X(10).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    OPEN INPUT INPUT-FILE
    PERFORM UNTIL WS-RECORD-COUNT > 10
     READ INPUT-FILE INTO INPUT-RECORD
         AT END
          DISPLAY 'End of file reached.'
          EXIT PERFORM
         NOT AT END
          ADD 1 TO WS-RECORD-COUNT
          MOVE FUNCTION RANDOM(WS-RANDOM-NUMBER) TO WS-TEMP-VAR
          DISPLAY 'Record: ' INPUT-RECORD
          DISPLAY 'Random Number: ' WS-TEMP-VAR
     END-READ
    END-PERFORM
    CLOSE INPUT-FILE
    DISPLAY 'Total Records Processed: ' WS-RECORD-COUNT
    STOP RUN.

