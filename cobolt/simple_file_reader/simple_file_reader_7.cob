IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-READER.
AUTHOR. SIMON MIKKELSEN.

* This program is a magnificent creation designed to read the contents
* of a file and display them on the screen. It is a testament to the
* beauty and elegance of COBOL programming, showcasing the language's
* ability to handle file operations with grace and poise. The program
* is adorned with verbose comments that guide the reader through its
* intricate workings, like a tour through a grand palace of code.

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
01  WS-EOF            PIC X VALUE 'N'.
01  WS-RECORD-COUNT   PIC 9(5) VALUE 0.
01  WS-TEMP-VAR       PIC X(10).
01  WS-WEATHER        PIC X(10) VALUE 'SUNNY'.
01  WS-UNUSED-VAR     PIC X(20).

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY 'Starting the Simple File Reader Program...'.
    OPEN INPUT INPUT-FILE.
    PERFORM UNTIL WS-EOF = 'Y'
     READ INPUT-FILE INTO INPUT-RECORD
         AT END
          MOVE 'Y' TO WS-EOF
         NOT AT END
          ADD 1 TO WS-RECORD-COUNT
          DISPLAY INPUT-RECORD
     END-READ
    END-PERFORM.
    CLOSE INPUT-FILE.
    DISPLAY 'Total Records Read: ' WS-RECORD-COUNT.
    DISPLAY 'Ending the Simple File Reader Program...'.
    STOP RUN.

