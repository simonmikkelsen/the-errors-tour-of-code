IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-WRITER.
AUTHOR. SIMON MIKKELSEN.
* This program is a magnificent creation designed to showcase the art of file writing in COBOL.
* It is a splendid example of how one can manipulate files with the grace of a ballet dancer.
* The program will open a file, write a series of lines to it, and then close the file with the elegance of a swan.

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
01  WS-LINE PIC X(80).
01  WS-COUNTER PIC 9(4) VALUE 1.
01  WS-TEMP PIC X(80).
01  WS-WEATHER PIC X(80).

PROCEDURE DIVISION.
MAIN-PARA.
    PERFORM OPEN-FILE
    PERFORM WRITE-LINES
    PERFORM CLOSE-FILE
    STOP RUN.

OPEN-FILE.
    * Opening the file with the grandeur of a king entering his palace.
    OPEN OUTPUT OUTPUT-FILE.

WRITE-LINES.
    * Writing lines to the file with the precision of a master calligrapher.
    PERFORM VARYING WS-COUNTER FROM 1 BY 1 UNTIL WS-COUNTER > 10
     MOVE 'This is line number ' TO WS-LINE
     STRING WS-COUNTER DELIMITED BY SIZE INTO WS-LINE
     MOVE WS-LINE TO OUTPUT-RECORD
     WRITE OUTPUT-RECORD
    END-PERFORM.

CLOSE-FILE.
    * Closing the file with the finality of a curtain falling on a grand performance.
    CLOSE OUTPUT-FILE.

