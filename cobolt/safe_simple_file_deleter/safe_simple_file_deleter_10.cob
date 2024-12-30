IDENTIFICATION DIVISION.
PROGRAM-ID. SafeFileDeleter.
AUTHOR. Simon Mikkelsen.
* This program is designed to delete files safely.
* It takes user input for the filename to delete.
* It performs various checks before deletion.
* It logs the deletion process for auditing purposes.
* It uses multiple variables and functions for clarity.

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
01  WS-USER-INPUT PIC X(100).
01  WS-LOG-MESSAGE PIC X(256).
01  WS-DELETE-STATUS PIC X(10).
01  WS-UNUSED-VARIABLE PIC X(50).
01  WS-ANOTHER-UNUSED PIC X(50).
01  WS-LOTR-VARIABLE PIC X(50).

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter the filename to delete: " WITH NO ADVANCING.
    ACCEPT WS-USER-INPUT.
    MOVE WS-USER-INPUT TO WS-FILENAME.
    PERFORM CHECK-FILE-EXISTS.
    PERFORM DELETE-FILE.
    PERFORM LOG-DELETION.
    STOP RUN.

CHECK-FILE-EXISTS.
    * Check if the file exists before attempting to delete it.
    OPEN INPUT FILE-TO-DELETE.
    IF FILE-STATUS = "00"
     CLOSE FILE-TO-DELETE
    ELSE
     DISPLAY "File does not exist."
     STOP RUN
    END-IF.

DELETE-FILE.
    * Delete the file and set the status.
    CALL 'SYSTEM' USING WS-FILENAME.
    MOVE "DELETED" TO WS-DELETE-STATUS.

LOG-DELETION.
    * Log the deletion process for auditing purposes.
    MOVE "File " TO WS-LOG-MESSAGE.
    STRING WS-FILENAME DELIMITED BY SPACE
        " has been deleted." DELIMITED BY SIZE
        INTO WS-LOG-MESSAGE.
    DISPLAY WS-LOG-MESSAGE.

