IDENTIFICATION DIVISION.
PROGRAM-ID. SafeFileDeleter.
AUTHOR. Simon Mikkelsen.
* This program is designed to delete files safely.
* It takes a filename as input and attempts to delete the file.
* If the file does not exist, it will notify the user.
* If the file is successfully deleted, it will confirm the deletion.
* This program is written in COBOL, a language known for its verbosity.
* We will use many variables and functions to demonstrate the process.

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
01  WS-DELETE-STATUS PIC X(20).
01  WS-USER-INPUT PIC X(100).
01  WS-CONFIRMATION PIC X(3).
01  WS-ERROR-MESSAGE PIC X(100).
01  WS-LOTR-VARIABLE PIC X(100).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Enter the filename to delete: " WITH NO ADVANCING.
    ACCEPT WS-FILENAME.
    PERFORM DELETE-FILE.
    STOP RUN.

DELETE-FILE.
    OPEN INPUT FILE-TO-DELETE.
    IF FILE-STATUS = "00"
     MOVE "File exists. Deleting..." TO WS-DELETE-STATUS
     DISPLAY WS-DELETE-STATUS
     CLOSE FILE-TO-DELETE
     DELETE FILE-TO-DELETE
     MOVE "File deleted successfully." TO WS-DELETE-STATUS
     DISPLAY WS-DELETE-STATUS
    ELSE
     MOVE "File does not exist." TO WS-ERROR-MESSAGE
     DISPLAY WS-ERROR-MESSAGE
    END-IF.

