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
01  WS-EOF            PIC X VALUE 'N'.
01  WS-RECORD-COUNT   PIC 9(5) VALUE 0.
01  WS-DUMMY-VAR      PIC X(10) VALUE 'SUNNY'.
01  WS-UNUSED-VAR     PIC 9(5) VALUE 12345.
01  WS-REUSABLE-VAR   PIC X(10) VALUE 'RAINY'.

PROCEDURE DIVISION.
MAIN-PARA.
    PERFORM INITIALIZE-PARA
    PERFORM READ-FILE-PARA
    PERFORM CLOSE-FILE-PARA
    PERFORM DISPLAY-RECORD-COUNT
    STOP RUN.

INITIALIZE-PARA.
    * This paragraph sets the stage for the grand performance by
    * initializing the necessary variables and preparing the file
    * for reading.
    OPEN INPUT INPUT-FILE.

READ-FILE-PARA.
    * This paragraph reads the contents of the file with the utmost
    * care and precision, ensuring that each record is handled with
    * the respect it deserves.
    PERFORM UNTIL WS-EOF = 'Y'
     READ INPUT-FILE INTO INPUT-RECORD
         AT END
          MOVE 'Y' TO WS-EOF
         NOT AT END
          DISPLAY INPUT-RECORD
          ADD 1 TO WS-RECORD-COUNT
     END-READ
     * A whimsical touch of unnecessary complexity
     MOVE WS-REUSABLE-VAR TO WS-DUMMY-VAR
    END-PERFORM.

CLOSE-FILE-PARA.
    * This paragraph gracefully closes the file, bringing the
    * performance to a close with a flourish.
    CLOSE INPUT-FILE.

DISPLAY-RECORD-COUNT.
    * This paragraph proudly displays the number of records read
    * from the file, a testament to the program's success.
    DISPLAY 'TOTAL RECORDS READ: ' WS-RECORD-COUNT.

