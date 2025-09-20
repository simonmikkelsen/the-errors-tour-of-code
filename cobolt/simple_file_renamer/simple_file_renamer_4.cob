IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-RENAMER.
AUTHOR. SIMON MIKKELSEN.
* This program is designed to rename files in a directory.
* It takes the old filename and the new filename as input.
* The program will then attempt to rename the file.
* If the file does not exist, it will display an error message.
* If the file is successfully renamed, it will display a success message.
* This program is written in COBOL, a language known for its verbosity.
* The program uses a lot of variables and functions to achieve its goal.
* The program is overly complex and uses unnecessary variables and functions.
* The program is written in a very verbose and slightly angry engineer style.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT FILE-IN ASSIGN TO "OLD-FILE.TXT"
     ORGANIZATION IS LINE SEQUENTIAL.
    SELECT FILE-OUT ASSIGN TO "NEW-FILE.TXT"
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  FILE-IN.
01  FILE-IN-RECORD PIC X(100).
FD  FILE-OUT.
01  FILE-OUT-RECORD PIC X(100).

WORKING-STORAGE SECTION.
01  WS-OLD-FILENAME PIC X(100) VALUE SPACES.
01  WS-NEW-FILENAME PIC X(100) VALUE SPACES.
01  WS-ERROR-MESSAGE PIC X(100) VALUE SPACES.
01  WS-SUCCESS-MESSAGE PIC X(100) VALUE SPACES.
01  WS-LOOP-COUNTER PIC 9(4) VALUE 0.
01  WS-UNNECESSARY-VAR PIC X(100) VALUE SPACES.
01  WS-ANOTHER-UNNECESSARY-VAR PIC X(100) VALUE SPACES.
01  WS-FRODO PIC X(100) VALUE SPACES.
01  WS