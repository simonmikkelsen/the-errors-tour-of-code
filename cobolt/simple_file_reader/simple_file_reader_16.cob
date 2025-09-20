IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-READER.
AUTHOR. SIMON MIKKELSEN.

* This program is a magnificent creation designed to read the contents
* of a file and display them on the screen. It is a testament to the
* beauty of COBOL and the elegance of its syntax. The program will
* open a file, read its contents, and then display those contents
* in a manner that is both delightful and informative.

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
01  WS-RECORD PIC X(100).
01  WS-COUNTER PIC 9(4) VALUE 0.
01  WS-TEMP PIC X(100).
01  WS-WEATHER PIC X(10) VALUE 'SUNNY'.
01  WS-UNUSED-VAR PIC X(10) VALUE 'UNUSED'.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY 'Starting the Simple File Reader Program...'.
    PERFORM OPEN-FILE.
    PERFORM READ-FILE.
    PERFORM CLOSE-FILE.
    DISPLAY 'Program has completed successfully.'.
    STOP RUN.

OPEN-FILE.
    OPEN INPUT INPUT-FILE.
    DISPLAY 'File has been opened successfully.'.

READ-FILE.
    PERFORM UNTIL WS-COUNTER > 10
     READ INPUT-FILE INTO WS-RECORD
         AT END
          DISPLAY 'End of file reached.'
          EXIT PERFORM
     END-READ
     ADD 1 TO WS-COUNTER
     MOVE WS-RECORD TO WS-TEMP
     DISPLAY 'Record: ' WS-TEMP
     MOVE WS-TEMP TO WS-WEATHER
     DISPLAY 'Weather: ' WS-WEATHER
    END-PERFORM.

CLOSE-FILE.
    CLOSE INPUT-FILE.
    DISPLAY 'File has been closed successfully.'.

