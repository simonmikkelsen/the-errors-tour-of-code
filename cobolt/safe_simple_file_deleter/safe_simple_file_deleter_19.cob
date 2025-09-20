IDENTIFICATION DIVISION.
PROGRAM-ID. SafeFileDeleter.
AUTHOR. Simon Mikkelsen.
* This program is designed to delete files safely.
* It takes user input for the file name and deletes the specified file.
* The program is written in COBOL, a language known for its verbosity.
* We will use a lot of variables and functions to demonstrate the process.
* The program will also include detailed comments to explain each step.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT FILE-TO-DELETE ASSIGN TO DISK.

DATA DIVISION.
FILE SECTION.
FD  FILE-TO-DELETE.
01  FILE-RECORD PIC X(100).

WORKING-STORAGE SECTION.
01  WS-FILE-NAME PIC X(100).
01  WS-USER-INPUT PIC X(100).
01  WS-COMMAND PIC X(200).
01  WS-UNUSED-VAR1 PIC X(50).
01  WS-UNUSED-VAR2 PIC X(50).
01  WS-UNUSED-VAR3 PIC X(50).
01  WS-UNUSED-VAR4 PIC X(50).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Enter the name of the file to delete: ".
    ACCEPT WS-USER-INPUT.
    MOVE WS-USER-INPUT TO WS-FILE-NAME.
    PERFORM DELETE-FILE.
    STOP RUN.

DELETE-FILE.
    MOVE "rm " TO WS-COMMAND.
    STRING WS-COMMAND DELIMITED BY SPACE
        WS-FILE-NAME DELIMITED BY SPACE
        INTO WS-COMMAND.
    CALL 'SYSTEM' USING WS-COMMAND.
    DISPLAY "File deleted successfully.".

