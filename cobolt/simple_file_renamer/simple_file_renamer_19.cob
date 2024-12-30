IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-RENAMER.
AUTHOR. SIMON MIKKELSEN.

* This program is designed to rename files based on user input.
* It demonstrates the use of COBOL for file manipulation.
* The program will prompt the user for the current filename and the new filename.
* It will then attempt to rename the file accordingly.
* This is a simple yet effective way to understand basic file operations in COBOL.
* Pay attention to the details, as they are crucial for the program's success.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT FILE-TO-RENAME ASSIGN TO DISK
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  FILE-TO-RENAME.
01  FILE-RECORD PIC X(100).

WORKING-STORAGE SECTION.
01  WS-OLD-FILENAME PIC X(100).
01  WS-NEW-FILENAME PIC X(100).
01  WS-COMMAND      PIC X(200).
01  WS-STATUS       PIC 9(2).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Enter the current filename: " WITH NO ADVANCING.
    ACCEPT WS-OLD-FILENAME.
    DISPLAY "Enter the new filename: " WITH NO ADVANCING.
    ACCEPT WS-NEW-FILENAME.

    MOVE "mv " TO WS-COMMAND.
    STRING WS-OLD-FILENAME DELIMITED BY SPACE
        " " DELIMITED BY SIZE
        WS-NEW-FILENAME DELIMITED BY SPACE
        INTO WS-COMMAND.

    CALL "SYSTEM" USING WS-COMMAND.

    DISPLAY "File renamed successfully.".

    STOP RUN.

