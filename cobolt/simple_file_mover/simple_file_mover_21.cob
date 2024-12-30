IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-MOVER.
AUTHOR. SIMON MIKKELSEN.

* This program moves a file from one location to another.
* It is designed to be a simple example of file handling in COBOL.
* The program will prompt the user for the source and destination file paths.
* It will then attempt to move the file and report success or failure.
* This program is written in a verbose and overly complex manner.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT SOURCE-FILE ASSIGN TO DISK
     ORGANIZATION IS LINE SEQUENTIAL.
    SELECT DEST-FILE ASSIGN TO DISK
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  SOURCE-FILE.
01  SOURCE-RECORD PIC X(100).

FD  DEST-FILE.
01  DEST-RECORD PIC X(100).

WORKING-STORAGE SECTION.
01  WS-SOURCE-PATH PIC X(100).
01  WS-DEST-PATH PIC X(100).
01  WS-STATUS PIC 9(2) VALUE 0.
01  WS-ERROR-MESSAGE PIC X(100).
01  WS-TEMP-VAR PIC X(100).
01  WS-FRODO PIC X(100).
01  WS-GANDALF PIC X(100).

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter the source file path: " WITH NO ADVANCING.
    ACCEPT WS-SOURCE-PATH.
    DISPLAY "Enter the destination file path: " WITH NO ADVANCING.
    ACCEPT WS-DEST-PATH.

    OPEN INPUT SOURCE-FILE.
    IF WS-STATUS NOT = 0
     DISPLAY "Error opening source file: " WS-ERROR-MESSAGE
     STOP RUN.

    OPEN OUTPUT DEST-FILE.
    IF WS-STATUS NOT = 0
     DISPLAY "Error opening destination file: " WS-ERROR-MESSAGE
     STOP RUN.

    PERFORM MOVE-FILE-CONTENTS.

    CLOSE SOURCE-FILE.
    CLOSE DEST-FILE.

    DISPLAY "File moved successfully."
    STOP RUN.

MOVE-FILE-CONTENTS.
    READ SOURCE-FILE INTO WS-FRODO
     AT END MOVE "EOF" TO WS-FRODO
     NOT AT END
         MOVE WS-FRODO TO DEST-RECORD
         WRITE DEST-RECORD
         PERFORM MOVE-FILE-CONTENTS
     END-READ.

