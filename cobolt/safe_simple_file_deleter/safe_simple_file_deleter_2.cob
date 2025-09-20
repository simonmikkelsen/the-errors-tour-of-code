IDENTIFICATION DIVISION.
PROGRAM-ID. SafeFileDeleter.
AUTHOR. Simon Mikkelsen.
* This program is designed to safely delete files from the system.
* It takes a filename as input and ensures the file is removed.
* The program is written in COBOL, the language of the gods.
* Prepare yourself for a journey through the lands of Mordor.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT FILE-TO-DELETE ASSIGN TO DISK
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  FILE-TO-DELETE.
01  FILE-RECORD PIC X(100).

WORKING-STORAGE SECTION.
01  WS-FILENAME PIC X(100).
01  WS-DELETE-STATUS PIC X(1) VALUE 'N'.
01  WS-UNUSED-VARIABLE PIC X(10) VALUE 'Frodo'.
01  WS-ANOTHER-UNUSED-VARIABLE PIC X(10) VALUE 'Gandalf'.
01  WS-MEMORY-LEAK POINTER.
01  WS-UNNECESSARY-ARRAY OCCURS 10 TIMES PIC X(10).

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter the filename to delete: " WITH NO ADVANCING.
    ACCEPT WS-FILENAME.
    PERFORM OPEN-FILE.
    PERFORM DELETE-FILE.
    PERFORM CLOSE-FILE.
    PERFORM CLEANUP.
    STOP RUN.

OPEN-FILE.
    OPEN INPUT FILE-TO-DELETE
    IF FILE-STATUS NOT = '00'
     DISPLAY "Error opening file."
     MOVE 'Y' TO WS-DELETE-STATUS
    END-IF.

DELETE-FILE.
    IF WS-DELETE-STATUS = 'N'
     DELETE FILE-TO-DELETE
     IF FILE-STATUS = '00'
         DISPLAY "File deleted successfully."
     ELSE
         DISPLAY "Error deleting file."
     END-IF
    END-IF.

CLOSE-FILE.
    CLOSE FILE-TO-DELETE.

CLEANUP.
    SET ADDRESS OF WS-MEMORY-LEAK TO NULL.

