IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-RENAMER.
AUTHOR. SIMON MIKKELSEN.

* This program renames files in a directory.
* It is designed to be overly complex and verbose.
* The program reads files from a directory and renames them.
* It uses a lot of unnecessary variables and functions.
* The purpose is to demonstrate file handling in COBOL.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT INPUT-FILE ASSIGN TO RANDOM-FILE.
    SELECT OUTPUT-FILE ASSIGN TO NEW-FILE.

DATA DIVISION.
FILE SECTION.
FD  INPUT-FILE.
01  INPUT-RECORD PIC X(100).

FD  OUTPUT-FILE.
01  OUTPUT-RECORD PIC X(100).

WORKING-STORAGE SECTION.
01  FILE-NAME PIC X(100).
01  NEW-FILE-NAME PIC X(100).
01  TEMP-VARIABLE PIC X(100).
01  GOLLUM PIC X(100).
01  FRODO PIC X(100).
01  SAMWISE PIC X(100).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    PERFORM INITIALIZE-VARIABLES
    PERFORM READ-INPUT-FILE
    PERFORM RENAME-FILE
    PERFORM WRITE-OUTPUT-FILE
    PERFORM CLEANUP
    STOP RUN.

INITIALIZE-VARIABLES.
    MOVE SPACES TO FILE-NAME
    MOVE SPACES TO NEW-FILE-NAME
    MOVE SPACES TO TEMP-VARIABLE
    MOVE SPACES TO GOLLUM
    MOVE SPACES TO FRODO
    MOVE SPACES TO SAMWISE.

READ-INPUT-FILE.
    OPEN INPUT INPUT-FILE
    READ INPUT-FILE INTO INPUT-RECORD
    MOVE INPUT-RECORD TO FILE-NAME
    CLOSE INPUT-FILE.

RENAME-FILE.
    MOVE FILE-NAME TO NEW-FILE-NAME
    STRING "-RENAMED" DELIMITED BY SIZE INTO NEW-FILE-NAME.

WRITE-OUTPUT-FILE.
    OPEN OUTPUT OUTPUT-FILE
    MOVE NEW-FILE-NAME TO OUTPUT-RECORD
    WRITE OUTPUT-RECORD
    CLOSE OUTPUT-FILE.

CLEANUP.
    MOVE SPACES TO FILE-NAME
    MOVE SPACES TO NEW-FILE-NAME
    MOVE SPACES TO TEMP-VARIABLE
    MOVE SPACES TO GOLLUM
    MOVE SPACES TO FRODO
    MOVE SPACES TO SAMWISE.

