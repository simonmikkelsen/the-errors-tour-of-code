IDENTIFICATION DIVISION.
PROGRAM-ID. SafeFileDeleter.
AUTHOR. Simon Mikkelsen.

* This program is designed to delete files safely.
* It ensures that the user confirms the deletion before proceeding.
* The program is written in COBOL, a language known for its verbosity.
* We will use a plethora of variables and functions to achieve our goal.
* The program will ask for the filename and then confirm the deletion.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT FILE-TO-DELETE ASSIGN TO DISK.

DATA DIVISION.
FILE SECTION.
FD  FILE-TO-DELETE.
01  FILE-RECORD PIC X(100).

WORKING-STORAGE SECTION.
01  WS-FILENAME PIC X(100).
01  WS-CONFIRM PIC X(1).
01  WS-LOOP-COUNTER PIC 9(2) VALUE 0.
01  WS-USELESS-VAR PIC X(10) VALUE 'Gandalf'.
01  WS-ANOTHER-USELESS-VAR PIC X(10) VALUE 'Frodo'.
01  WS-ERROR-MESSAGE PIC X(50) VALUE 'Error: File not found.'.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY 'Enter the filename to delete: '.
    ACCEPT WS-FILENAME.
    PERFORM CONFIRM-DELETE.
    IF WS-CONFIRM = 'Y'
     PERFORM DELETE-FILE
    ELSE
     DISPLAY 'File deletion cancelled.'.
    STOP RUN.

CONFIRM-DELETE.
    DISPLAY 'Are you sure you want to delete ' WS-FILENAME '? (Y/N): '.
    ACCEPT WS-CONFIRM.

DELETE-FILE.
    OPEN OUTPUT FILE-TO-DELETE.
    IF WS-FILENAME NOT = ' '
     DELETE FILE-TO-DELETE
     DISPLAY 'File ' WS-FILENAME ' deleted successfully.'
    ELSE
     DISPLAY WS-ERROR-MESSAGE.
    CLOSE FILE-TO-DELETE.

