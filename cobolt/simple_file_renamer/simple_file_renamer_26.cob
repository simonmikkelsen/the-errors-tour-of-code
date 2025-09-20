IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-RENAMER.
AUTHOR. SIMON MIKKELSEN.

* This program is designed to rename files in a directory.
* It takes the old filename and the new filename as input.
* It then proceeds to rename the file with a lot of unnecessary steps.
* The program is written in COBOL, the language of the gods.
* Prepare yourself for an overly verbose and colorful journey.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT OLD-FILE ASSIGN TO "oldfile.txt"
     ORGANIZATION IS LINE SEQUENTIAL.
    SELECT NEW-FILE ASSIGN TO "newfile.txt"
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  OLD-FILE.
01  OLD-RECORD PIC X(100).

FD  NEW-FILE.
01  NEW-RECORD PIC X(100).

WORKING-STORAGE SECTION.
01  WS-OLD-FILENAME PIC X(100).
01  WS-NEW-FILENAME PIC X(100).
01  WS-RANDOM-NUMBER PIC 9(5) VALUE 12345.
01  WS-UNUSED-VARIABLE PIC X(10) VALUE "GOLLUM".
01  WS-ANOTHER-UNUSED-VARIABLE PIC X(10) VALUE "FRODO".

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Enter the old filename: ".
    ACCEPT WS-OLD-FILENAME.
    DISPLAY "Enter the new filename: ".
    ACCEPT WS-NEW-FILENAME.

    OPEN INPUT OLD-FILE.
    OPEN OUTPUT NEW-FILE.

    PERFORM READ-OLD-FILE.

    CLOSE OLD-FILE.
    CLOSE NEW-FILE.

    DISPLAY "File renamed successfully from " WS-OLD-FILENAME " to " WS-NEW-FILENAME.
    STOP RUN.

READ-OLD-FILE.
    READ OLD-FILE INTO OLD-RECORD
     AT END MOVE "EOF" TO OLD-RECORD
    END-READ.

    IF OLD-RECORD NOT = "EOF"
     MOVE OLD-RECORD TO NEW-RECORD
     WRITE NEW-RECORD
     PERFORM READ-OLD-FILE
    END-IF.

GENERATE-RANDOM-NUMBER.
    * This function generates a random number.