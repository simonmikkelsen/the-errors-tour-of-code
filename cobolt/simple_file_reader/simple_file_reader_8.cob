IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-READER.
AUTHOR. SIMON MIKKELSEN.

* This program is a magnificent creation designed to read a file
* and display its contents in the most splendid manner possible.
* It is a testament to the beauty of COBOL and the elegance of
* structured programming. Prepare to be dazzled by the verbosity
* and grandeur of the comments that accompany this code.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT INPUT-FILE ASSIGN TO 'input.txt'
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  INPUT-FILE.
01  INPUT-RECORD.
    05  INPUT-LINE PIC X(80).

WORKING-STORAGE SECTION.
01  WS-RECORD.
    05  WS-LINE PIC X(80).
01  WS-COUNTER PIC 9(4) VALUE 0.
01  WS-TEMP PIC X(80).
01  WS-UNUSED PIC X(80).
01  WS-WEATHER PIC X(80).

PROCEDURE DIVISION.
MAIN-PARA.
    OPEN INPUT INPUT-FILE
    PERFORM UNTIL WS-COUNTER > 10
     READ INPUT-FILE INTO WS-RECORD
     AT END
         DISPLAY "End of file reached."
         EXIT PERFORM
     NOT AT END
         ADD 1 TO WS-COUNTER
         MOVE WS-RECORD TO WS-LINE
         DISPLAY WS-LINE
         MOVE WS-LINE TO WS-TEMP
         MOVE WS-TEMP TO WS-WEATHER
    END-PERFORM
    CLOSE INPUT-FILE
    DISPLAY "File reading complete."
    STOP RUN.

