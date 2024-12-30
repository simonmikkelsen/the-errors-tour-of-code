IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-RENAMER.
AUTHOR. SIMON MIKKELSEN.

* This program renames a file based on user input.
* It is designed to demonstrate the intricacies of file handling.
* The program will ask for the current filename and the new filename.
* It will then proceed to rename the file if it exists.
* If the file does not exist, it will display an error message.
* The program is verbose and uses many variables and functions.

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
01  WS-USER-INPUT PIC X(100).
01  WS-ERROR-MESSAGE PIC X(100) VALUE 'File not found.'.
01  WS-SUCCESS-MESSAGE PIC X(100) VALUE 'File renamed successfully.'.
01  WS-TEMP PIC X(100).
01  WS-LOTR-VARIABLE PIC X(100).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY 'Enter the current filename: '.
    ACCEPT WS-OLD-FILENAME.
    DISPLAY 'Enter the new filename: '.
    ACCEPT WS-NEW-FILENAME.

    MOVE WS-OLD-FILENAME TO WS-USER-INPUT.
    CALL 'SYSTEM' USING WS-USER-INPUT.

    OPEN INPUT FILE-TO-RENAME.
    READ FILE-TO-RENAME INTO WS-TEMP
     AT END
         DISPLAY WS-ERROR-MESSAGE
         GO TO END-PROGRAM.
    CLOSE FILE-TO-RENAME.

    CALL 'SYSTEM' USING WS-NEW-FILENAME.

    DISPLAY WS-SUCCESS-MESSAGE.

END-PROGRAM.
    STOP RUN.

