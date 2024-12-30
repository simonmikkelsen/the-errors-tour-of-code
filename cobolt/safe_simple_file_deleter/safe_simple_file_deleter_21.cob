IDENTIFICATION DIVISION.
PROGRAM-ID. SafeFileDeleter.
AUTHOR. Simon Mikkelsen.
* This program is designed to delete files safely.
* It takes user input for the file name and confirms deletion.
* The program is overly verbose and uses unnecessary variables.
* It is written in a very precise and slightly angry engineer style.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.
SOURCE-COMPUTER. IBM-370.
OBJECT-COMPUTER. IBM-370.

DATA DIVISION.
FILE SECTION.
FD  FILE-TO-DELETE.
01  FILE-RECORD PIC X(100).

WORKING-STORAGE SECTION.
01  WS-FILE-NAME PIC X(100).
01  WS-CONFIRMATION PIC X(1).
01  WS-UNNECESSARY-VAR1 PIC X(10) VALUE 'UNUSED'.
01  WS-UNNECESSARY-VAR2 PIC X(10) VALUE 'UNUSED'.
01  WS-UNNECESSARY-VAR3 PIC X(10) VALUE 'UNUSED'.
01  WS-UNNECESSARY-VAR4 PIC X(10) VALUE 'UNUSED'.
01  WS-UNNECESSARY-VAR5 PIC X(10) VALUE 'UNUSED'.
01  WS-UNNECESSARY-VAR6 PIC X(10) VALUE 'UNUSED'.
01  WS-UNNECESSARY-VAR7 PIC X(10) VALUE 'UNUSED'.
01  WS-UNNECESSARY-VAR8 PIC X(10) VALUE 'UNUSED'.
01  WS-UNNECESSARY-VAR9 PIC X(10) VALUE 'UNUSED'.
01  WS-UNNECESSARY-VAR10 PIC X(10) VALUE 'UNUSED'.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter the name of the file to delete: " WITH NO ADVANCING.
    ACCEPT WS-FILE-NAME.
    PERFORM CONFIRM-DELETE.
    IF WS-CONFIRMATION = 'Y'
     PERFORM DELETE-FILE
    ELSE
     DISPLAY "File deletion cancelled.".

CONFIRM-DELETE.
    DISPLAY "Are you sure you want to delete " WS-FILE-NAME "? (Y/N): " WITH NO ADVANCING.
    ACCEPT WS-CONFIRMATION.

DELETE-FILE.
    OPEN OUTPUT FILE-TO-DELETE.
    WRITE FILE-RECORD FROM WS-FILE-NAME.
    CLOSE FILE-TO-DELETE.
    DISPLAY "File " WS-FILE-NAME " deleted successfully.".

END-MAIN.
    STOP RUN.
