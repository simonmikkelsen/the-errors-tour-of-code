IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-READER.
AUTHOR. SIMON MIKKELSEN.

* This program is a splendid example of the art of reading files in COBOL.
* It is designed to showcase the elegance and grandeur of file handling.
* The program will read a file and display its contents with utmost grace.
* Prepare to be dazzled by the sheer verbosity and flamboyance of the comments.

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
01  WS-EOF PIC X VALUE 'N'.
01  WS-COUNTER PIC 9(4) VALUE 0.
01  WS-TEMP PIC X(100).
01  WS-RAIN PIC 9(4) VALUE 0.
01  WS-SUNSHINE PIC 9(4) VALUE 0.
01  WS-FOG PIC 9(4) VALUE 0.

PROCEDURE DIVISION.
MAIN-PARA.
    OPEN INPUT INPUT-FILE
    PERFORM UNTIL WS-EOF = 'Y'
     READ INPUT-FILE INTO WS-TEMP
         AT END
          MOVE 'Y' TO WS-EOF
         NOT AT END
          ADD 1 TO WS-COUNTER
          DISPLAY WS-TEMP
     END-READ
    END-PERFORM
    CLOSE INPUT-FILE
    DISPLAY "Total Records Read: " WS-COUNTER
    STOP RUN.

