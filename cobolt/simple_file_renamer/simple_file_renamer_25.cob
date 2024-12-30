IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-RENAMER.
AUTHOR. SIMON MIKKELSEN.

* This program renames files in a directory.
* It takes the old filename and the new filename as input.
* Then it performs the renaming operation.
* This program is designed to be overly verbose and complex.
* It includes many unnecessary variables and functions.
* The purpose is to demonstrate file renaming in COBOL.

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
01  WS-RANDOM-SEED PIC 9(4) VALUE 1337.
01  WS-RANDOM-NUMBER PIC 9(4).
01  WS-UNUSED-VARIABLE PIC X(10) VALUE "GOLLUM".
01  WS-ANOTHER-UNUSED-VARIABLE PIC X(10) VALUE "FRODO".

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter the old filename: ".
    ACCEPT WS-OLD-FILENAME.
    DISPLAY "Enter the new filename: ".
    ACCEPT WS-NEW-FILENAME.

    CALL 'RANDOM-NUMBER-GENERATOR' USING WS-RANDOM-SEED
                       WS-RANDOM-NUMBER.

    OPEN INPUT OLD-FILE.
    OPEN OUTPUT NEW-FILE.

    PERFORM UNTIL EOF
     READ OLD-FILE INTO OLD-RECORD
         AT END
          MOVE "YES" TO EOF
     END-READ
     WRITE NEW-RECORD FROM OLD-RECORD
    END-PERFORM.

    CLOSE OLD-FILE.
    CLOSE NEW-FILE.

    DISPLAY "File renamed successfully from " WS-OLD-FILENAME " to " WS-NEW-FILENAME.
    STOP RUN.

RANDOM-NUMBER-GENERATOR.
    * This is a simple random number generator.
    * It uses a seed value to generate the number.
    * The seed value is always the same.
    COMPUTE WS-RANDOM-NUMBER = FUNCTION RANDOM(WS-RANDOM-SEED).

EOF SECTION.
01  EOF PIC X(3) VALUE "NO".

