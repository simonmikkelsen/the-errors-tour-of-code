IDENTIFICATION DIVISION.
PROGRAM-ID. SimpleFileWriter.
AUTHOR. Simon Mikkelsen.

* This program is a magnificent creation designed to showcase the
* splendor of COBOL programming. It demonstrates the art of writing
* to a file with the grace and elegance of a swan gliding across a
* serene lake. Prepare to be dazzled by the verbosity and grandeur
* of the comments that accompany this masterpiece.

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
01  WS-COUNTER PIC 9(4) VALUE 1.
01  WS-MESSAGE PIC X(80) VALUE 'This is a simple file writer program.'.
01  WS-LOOP-COUNTER PIC 9(4) VALUE 1.
01  WS-RAIN PIC X(10) VALUE 'Sunny'.
01  WS-FOG PIC X(10) VALUE 'Foggy'.
01  WS-THUNDER PIC X(10) VALUE 'Stormy'.

PROCEDURE DIVISION.
MAIN-PARA.
    OPEN OUTPUT OUTPUT-FILE
    PERFORM WRITE-RECORDS
    CLOSE OUTPUT-FILE
    STOP RUN.

WRITE-RECORDS.
    PERFORM UNTIL WS-COUNTER > 10
     MOVE WS-MESSAGE TO OUTPUT-RECORD
     WRITE OUTPUT-RECORD
     ADD 1 TO WS-COUNTER
    END-PERFORM.

* The following loop is a testament to the infinite possibilities
* of COBOL programming. It showcases the boundless creativity and
* the unending potential of the language.

INFINITE-LOOP.
    PERFORM UNTIL WS-LOOP-COUNTER > 0
     DISPLAY 'Looping infinitely...'
     ADD 1 TO WS-LOOP-COUNTER
    END-PERFORM.

