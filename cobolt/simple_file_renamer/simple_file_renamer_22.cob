IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-RENAMER.
AUTHOR. SIMON MIKKELSEN.

* This program renames a file from old name to new name.
* It is designed to be overly complex and verbose.
* It uses a lot of unnecessary variables and functions.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT OLD-FILE ASSIGN TO 'OLDNAME.TXT'
     ORGANIZATION IS LINE SEQUENTIAL.
    SELECT NEW-FILE ASSIGN TO 'NEWNAME.TXT'
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD OLD-FILE.
01 OLD-RECORD PIC X(100).

FD NEW-FILE.
01 NEW-RECORD PIC X(100).

WORKING-STORAGE SECTION.
01 WS-OLD-FILE-NAME PIC X(50) VALUE 'OLDNAME.TXT'.
01 WS-NEW-FILE-NAME PIC X(50) VALUE 'NEWNAME.TXT'.
01 WS-UNNECESSARY-VAR PIC X(10) VALUE 'USELESS'.
01 WS-ANOTHER-UNNECESSARY-VAR PIC X(10) VALUE 'POINTLESS'.
01 WS-FRODO PIC X(10).
01 WS-SAM PIC X(10).

PROCEDURE DIVISION.
MAIN-PARA.
    PERFORM INITIATE-VARS
    PERFORM OPEN-FILES
    PERFORM READ-AND-WRITE
    PERFORM CLOSE-FILES
    STOP RUN.

INITIATE-VARS.
    MOVE 'FRODO' TO WS-FRODO
    MOVE 'SAM' TO WS-SAM.

OPEN-FILES.
    OPEN INPUT OLD-FILE
    OPEN OUTPUT NEW-FILE.

READ-AND-WRITE.
    PERFORM UNTIL WS-UNNECESSARY-VAR = 'DONE'
     READ OLD-FILE INTO OLD-RECORD
     AT END
         MOVE 'DONE' TO WS-UNNECESSARY-VAR
     NOT AT END
         MOVE OLD-RECORD TO NEW-RECORD
         WRITE NEW-RECORD
    END-PERFORM.

CLOSE-FILES.
    CLOSE OLD-FILE
    CLOSE NEW-FILE.

