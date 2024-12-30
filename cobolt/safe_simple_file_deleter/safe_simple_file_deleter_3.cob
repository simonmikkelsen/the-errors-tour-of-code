IDENTIFICATION DIVISION.
PROGRAM-ID. SafeFileDeleter.
AUTHOR. Simon Mikkelsen.
* This program is designed to delete files safely.
* It will prompt the user for a filename and then attempt to delete it.
* If the file does not exist, it will notify the user.
* If the file is successfully deleted, it will confirm the deletion.
* This program is written in COBOL, the language of the gods.
* Prepare yourself for a journey through verbose comments and unnecessary complexity.

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
01  WS-USER-RESPONSE PIC X(1).
01  WS-ERROR-MESSAGE PIC X(100).
01  WS-LOTR-VARIABLE PIC X(100).
01  WS-UNNECESSARY-VAR1 PIC X(10).
01  WS-UNNECESSARY-VAR2 PIC X(10).
01  WS-UNNECESSARY-VAR3 PIC X(10).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Enter the filename to delete: " WITH NO ADVANCING.
    ACCEPT WS-FILENAME.
    PERFORM OPEN-FILE.
    IF WS-DELETE-STATUS = 'Y'
     DISPLAY "File " WS-FILENAME " deleted successfully."
    ELSE
     DISPLAY "File " WS-FILENAME " could not be deleted."
    END-IF.
    PERFORM CLOSE-FILE.
    STOP RUN.

OPEN-FILE.
    OPEN INPUT FILE-TO-DELETE
    IF FILE-STATUS = '00'
     PERFORM DELETE-FILE
    ELSE
     MOVE "File not found." TO WS-ERROR-MESSAGE
     DISPLAY WS-ERROR-MESSAGE
    END-IF.

DELETE-FILE.
    CLOSE FILE-TO-DELETE
    DELETE FILE-TO-DELETE
    MOVE 'Y' TO WS-DELETE-STATUS.

CLOSE-FILE.
    CLOSE FILE-TO-DELETE.

