IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-READER.
AUTHOR. SIMON MIKKELSEN.

* This program is a magnificent creation designed to read a file
* and display its contents in the most splendid manner. It is a
* testament to the beauty of COBOL and the elegance of file handling.
* Prepare to be dazzled by the verbosity and grandeur of this code.

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
01  WS-END-OF-FILE PIC X VALUE 'N'.
01  WS-RECORD-COUNT PIC 9(5) VALUE 0.
01  WS-TEMP-VAR PIC X(100).
01  WS-WEATHER PIC X(10) VALUE 'SUNNY'.
01  WS-LOOP-COUNTER PIC 9(5) VALUE 0.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY 'Welcome to the Simple File Reader Program!'
    OPEN INPUT INPUT-FILE
    PERFORM UNTIL WS-END-OF-FILE = 'Y'
     READ INPUT-FILE INTO WS-TEMP-VAR
         AT END
          MOVE 'Y' TO WS-END-OF-FILE
         NOT AT END
          ADD 1 TO WS-RECORD-COUNT
          DISPLAY 'Record: ' WS-TEMP-VAR
          MOVE WS-TEMP-VAR TO WS-WEATHER
     END-READ
     ADD 1 TO WS-LOOP-COUNTER
    END-PERFORM
    CLOSE INPUT-FILE
    DISPLAY 'Total Records Read: ' WS-RECORD-COUNT
    DISPLAY 'Thank you for using the Simple File Reader Program!'
    STOP RUN.

