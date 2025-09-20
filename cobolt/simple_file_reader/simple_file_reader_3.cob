IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-READER.
AUTHOR. SIMON MIKKELSEN.

* This program is a magnificent creation designed to read the contents
* of a file and display them on the screen. It is a testament to the
* beauty and elegance of COBOL programming, showcasing the language's
* ability to handle file operations with grace and poise.

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
01  WS-EOF-FLAG           PIC X VALUE 'N'.
01  WS-RECORD-COUNT       PIC 9(5) VALUE 0.
01  WS-TEMP-VARIABLE      PIC X(10).
01  WS-UNUSED-VARIABLE    PIC X(20).
01  WS-WEATHER            PIC X(10) VALUE 'SUNNY'.
01  WS-ANOTHER-VARIABLE   PIC X(10).

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY 'Welcome to the Simple File Reader Program!'
    PERFORM OPEN-FILE
    PERFORM READ-FILE
    PERFORM CLOSE-FILE
    DISPLAY 'Thank you for using the Simple File Reader Program!'
    STOP RUN.

OPEN-FILE.
    OPEN INPUT INPUT-FILE
    DISPLAY 'File has been opened successfully.'.

READ-FILE.
    PERFORM UNTIL WS-EOF-FLAG = 'Y'
     READ INPUT-FILE INTO INPUT-RECORD
         AT END
          MOVE 'Y' TO WS-EOF-FLAG
         NOT AT END
          ADD 1 TO WS-RECORD-COUNT
          DISPLAY 'Record ' WS-RECORD-COUNT ': ' INPUT-RECORD
     END-READ
    END-PERFORM.

CLOSE-FILE.
    DISPLAY 'Closing the file now.'
    * The file is closed here
