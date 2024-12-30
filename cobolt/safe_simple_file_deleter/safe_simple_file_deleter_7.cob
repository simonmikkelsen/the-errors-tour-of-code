IDENTIFICATION DIVISION.
PROGRAM-ID. SafeFileDeleter.
AUTHOR. Simon Mikkelsen.

* This program is designed to delete files safely.
* It ensures that the user confirms the deletion before proceeding.
* The program is written in COBOL, a language known for its verbosity.
* We will use a lot of variables and functions to demonstrate the process.
* The program will handle file operations with utmost care.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT FILE-TO-DELETE ASSIGN TO "file-to-delete.txt"
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  FILE-TO-DELETE.
01  FILE-RECORD PIC X(100).

WORKING-STORAGE SECTION.
01  WS-CONFIRMATION PIC X(1).
01  WS-FILE-STATUS PIC X(2) VALUE SPACES.
01  WS-USER-INPUT PIC X(1).
01  WS-UNNECESSARY-VAR1 PIC X(10) VALUE "Gandalf".
01  WS-UNNECESSARY-VAR2 PIC X(10) VALUE "Frodo".
01  WS-UNNECESSARY-VAR3 PIC X(10) VALUE "Aragorn".

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Do you really want to delete the file? (Y/N): ".
    ACCEPT WS-USER-INPUT.
    IF WS-USER-INPUT = "Y"
     PERFORM DELETE-FILE
    ELSE
     DISPLAY "File deletion aborted."
    END-IF.
    STOP RUN.

DELETE-FILE.
    OPEN INPUT FILE-TO-DELETE.
    IF WS-FILE-STATUS = "00"
     CLOSE FILE-TO-DELETE
     DELETE FILE-TO-DELETE
     DISPLAY "File deleted successfully."
    ELSE
     DISPLAY "Error: File not found or cannot be opened."
    END-IF.

