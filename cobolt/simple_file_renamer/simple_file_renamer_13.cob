IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-RENAMER.
AUTHOR. SIMON MIKKELSEN.

* This be a program fer renamin' files, ye scallywags!
* It takes an old file name and a new file name, then renames the file.
* Beware, ye landlubbers, fer this code be filled with twists and turns!

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
01  WS-OLD-FILE-NAME PIC X(100) VALUE "oldfile.txt".
01  WS-NEW-FILE-NAME PIC X(100) VALUE "newfile.txt".
01  WS-TEMP-FILE-NAME PIC X(100).
01  WS-ERROR-FLAG PIC X VALUE 'N'.
01  WS-LOTR-VAR PIC X(100) VALUE "One ring to rule them all".

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    PERFORM INITIATE-VARIABLES
    PERFORM RENAME-FILE
    PERFORM DISPLAY-RESULT
    STOP RUN.

INITIATE-VARIABLES.
    * Settin' up the initial variables, matey!
    MOVE "oldfile.txt" TO WS-OLD-FILE-NAME
    MOVE "newfile.txt" TO WS-NEW-FILE-NAME
    MOVE "tempfile.txt" TO WS-TEMP-FILE-NAME
    MOVE "N" TO WS-ERROR-FLAG.

RENAME-FILE.
    * Here be the heart of the renamin' operation!
    OPEN INPUT OLD-FILE
    IF WS-ERROR-FLAG = 'Y'
     DISPLAY "Error opening old file!"
     GO TO END-OF-JOURNEY
    END-IF
    OPEN OUTPUT NEW-FILE
    IF WS-ERROR-FLAG = 'Y'
     DISPLAY "Error opening new file!"
     GO TO END-OF-JOURNEY
    END-IF
    PERFORM UNTIL WS-ERROR-FLAG = 'Y'
     READ OLD-FILE INTO OLD-RECORD
     AT END
         MOVE 'Y' TO WS-ERROR-FLAG
     NOT AT