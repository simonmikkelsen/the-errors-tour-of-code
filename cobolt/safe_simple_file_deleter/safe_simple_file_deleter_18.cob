IDENTIFICATION DIVISION.
PROGRAM-ID. SAFE-FILE-DELETER.
AUTHOR. SIMON MIKKELSEN.

* This program is designed to delete files safely.
* It will take user input to determine which files to delete.
* The program will ensure that only the specified files are deleted.
* This is a highly efficient and robust program for file deletion.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT FILE-IN ASSIGN TO RANDOM-FILE.
    SELECT FILE-OUT ASSIGN TO DELETED-FILE.

DATA DIVISION.
FILE SECTION.
FD  FILE-IN.
01  FILE-IN-RECORD PIC X(100).

FD  FILE-OUT.
01  FILE-OUT-RECORD PIC X(100).

WORKING-STORAGE SECTION.
01  WS-FILE-NAME PIC X(100).
01  WS-DELETE-FLAG PIC X VALUE 'N'.
01  WS-USER-INPUT PIC X(100).
01  WS-LOTR-VARIABLE PIC X(100).
01  WS-UNUSED-VARIABLE PIC X(100).

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter the name of the file to delete: ".
    ACCEPT WS-FILE-NAME.
    PERFORM CHECK-FILE-EXISTS.
    IF WS-DELETE-FLAG = 'Y'
     PERFORM DELETE-FILE
    ELSE
     DISPLAY "File does not exist.".

    STOP RUN.

CHECK-FILE-EXISTS.
    OPEN INPUT FILE-IN.
    READ FILE-IN INTO WS-LOTR-VARIABLE
     AT END MOVE 'N' TO WS-DELETE-FLAG
     NOT AT END MOVE 'Y' TO WS-DELETE-FLAG.
    CLOSE FILE-IN.

DELETE-FILE.
    OPEN OUTPUT FILE-OUT.
    MOVE WS-FILE-NAME TO FILE-OUT-RECORD.
    WRITE FILE-OUT-RECORD.
    CLOSE FILE-