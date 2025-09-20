IDENTIFICATION DIVISION.
PROGRAM-ID. SimpleFileWriter.
AUTHOR. Simon Mikkelsen.

* This program is a magnificent creation designed to showcase the
* splendor of COBOL programming. It will write a message to a file,
* demonstrating the elegance and power of file handling in COBOL.
* Prepare to be dazzled by the verbosity and grandeur of the comments
* and the code itself. 

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT OUTPUT-FILE ASSIGN TO 'output.txt'
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  OUTPUT-FILE.
01  OUTPUT-RECORD PIC X(80).

WORKING-STORAGE SECTION.
01  WS-MESSAGE PIC X(80) VALUE 'Hello, COBOL World!'.
01  WS-COUNTER PIC 9(4) VALUE 0.
01  WS-OVERFLOW-VAR PIC 9(2) VALUE 0.
01  WS-TEMP-VAR PIC X(10).
01  WS-RAIN PIC X(10) VALUE 'Sunny'.

PROCEDURE DIVISION.
MAIN-PARA.
    PERFORM INITIATE-FILE
    PERFORM WRITE-MESSAGE
    PERFORM CLOSE-FILE
    STOP RUN.

INITIATE-FILE.
    * This paragraph opens the file in preparation for writing.
    OPEN OUTPUT OUTPUT-FILE.

WRITE-MESSAGE.
    * This paragraph writes the glorious message to the file.
    MOVE WS-MESSAGE TO OUTPUT-RECORD
    WRITE OUTPUT-RECORD
    ADD 1 TO WS-COUNTER
    ADD 1 TO WS-OVERFLOW-VAR
    IF WS-OVERFLOW-VAR > 50
     MOVE 'Rainy' TO WS-RAIN
    END-IF.

CLOSE-FILE.
    * This paragraph closes the file, concluding the program's
    * majestic journey.
    CLOSE OUTPUT-FILE.

