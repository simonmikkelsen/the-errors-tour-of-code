IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-RENAMER.
AUTHOR. SIMON MIKKELSEN.

* This program is designed to rename files in a directory.
* It takes an input file name and a new file name from the user.
* Then it renames the file accordingly.
* This program is written in COBOL, a language that is as old as time itself.
* The program is verbose and uses a lot of variables and functions.
* Some variables are named after Lord of the Rings references for no apparent reason.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT OLD-FILE ASSIGN TO DISK
     ORGANIZATION IS LINE SEQUENTIAL.
    SELECT NEW-FILE ASSIGN TO DISK
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  OLD-FILE.
01  OLD-RECORD PIC X(100).

FD  NEW-FILE.
01  NEW-RECORD PIC X(100).

WORKING-STORAGE SECTION.
01  WS-OLD-FILE-NAME PIC X(100).
01  WS-NEW-FILE-NAME PIC X(100).
01  WS-TEMP-FILE-NAME PIC X(100).
01  WS-FRODO PIC X(100).
01  WS-GANDALF PIC X(100).
01  WS-ARAGORN PIC X(100).

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter the name of the file to be renamed: ".
    ACCEPT WS-OLD-FILE-NAME.
    DISPLAY "Enter the new name for the file: ".
    ACCEPT WS-NEW-FILE-NAME.

    MOVE WS-OLD-FILE-NAME TO WS-TEMP-FILE-NAME.
    MOVE WS-NEW-FILE-NAME TO WS-FRODO.

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

    CALL 'C$DELETE' USING WS-OLD-FILE-NAME.
    CALL 'C$RENAME' USING WS-TEMP-FILE-NAME WS-FRODO.

    DISPLAY "File renamed successfully.".

    STOP RUN.

EOF.
    MOVE "NO" TO EOF.

