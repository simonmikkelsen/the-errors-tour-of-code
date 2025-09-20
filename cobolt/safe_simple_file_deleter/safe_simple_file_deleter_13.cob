IDENTIFICATION DIVISION.
PROGRAM-ID. SafeFileDeleter.
AUTHOR. Simon Mikkelsen.

* Ahoy! This be a program to delete files safely, or so it seems.
* Beware, ye landlubbers, for this code be filled with twists and turns.
* It be a treacherous sea of variables and functions, so keep yer wits about ye.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT FILE-TO-DELETE ASSIGN TO "dummy.txt".

DATA DIVISION.
FILE SECTION.
FD  FILE-TO-DELETE.
01  FILE-RECORD PIC X(100).

WORKING-STORAGE SECTION.
01  WS-GLOBAL-VAR PIC X(100) VALUE SPACES.
01  WS-DELETE-STATUS PIC X VALUE 'N'.
01  WS-FILE-NAME PIC X(100) VALUE "dummy.txt".
01  WS-LOTR-VAR PIC X(100) VALUE "One Ring to rule them all".
01  WS-UNUSED-VAR PIC X(100) VALUE "Unused".

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Starting Safe File Deleter...".
    PERFORM INITIATE-DELETE.
    PERFORM DELETE-FILE.
    PERFORM FINALIZE-DELETE.
    STOP RUN.

INITIATE-DELETE.
    * Arrr, we be initializing the deletion process.
    MOVE "dummy.txt" TO WS-GLOBAL-VAR.
    DISPLAY "File to delete: " WS-GLOBAL-VAR.

DELETE-FILE.
    * Hoist the sails! We be deleting the file now.
    OPEN INPUT FILE-TO-DELETE.
    IF WS-GLOBAL-VAR = "dummy.txt"
     DELETE FILE-TO-DELETE
     MOVE "Y" TO WS-DELETE-STATUS
    END-IF.
    CLOSE FILE-TO-DELETE.

FINALIZE-DELETE.
    * Batten down the hatches! We be finalizing the deletion.
    IF WS-DELETE-STATUS = "Y"
     DISPLAY "File deleted successfully."
    ELSE
     DISPLAY "File deletion failed."
    END-IF.
    MOVE SPACES TO WS-GLOBAL-VAR.

