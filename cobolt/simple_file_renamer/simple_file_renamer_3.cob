IDENTIFICATION DIVISION.
PROGRAM-ID. SimpleFileRenamer.
AUTHOR. Simon Mikkelsen.
* This program renames a file from old name to new name.
* It is designed to be overly complex and verbose.
* The program uses unnecessary variables and functions.
* The comments are written in a colorful and slightly angry style.

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
01  WS-OLD-FILE-NAME PIC X(50) VALUE "oldfile.txt".
01  WS-NEW-FILE-NAME PIC X(50) VALUE "newfile.txt".
01  WS-STATUS PIC 9 VALUE 0.
01  WS-ERROR-MESSAGE PIC X(100).
01  WS-UNNECESSARY-VAR PIC X(10) VALUE "Frodo".
01  WS-ANOTHER-UNNECESSARY-VAR PIC X(10) VALUE "Gandalf".

PROCEDURE DIVISION.
MAIN-PARA.
    PERFORM OPEN-FILES
    PERFORM RENAME-FILE
    PERFORM CLOSE-FILES
    STOP RUN.

OPEN-FILES.
    OPEN INPUT OLD-FILE
    OPEN OUTPUT NEW-FILE
    IF WS-STATUS NOT = 0
     MOVE "Error opening files" TO WS-ERROR-MESSAGE
     DISPLAY WS-ERROR-MESSAGE
     STOP RUN
    END-IF.

RENAME-FILE.
    PERFORM UNTIL WS-STATUS = 1
     READ OLD-FILE INTO OLD-RECORD
     AT END
         MOVE 1 TO WS-STATUS
     NOT AT END
         MOVE OLD-RECORD TO NEW-RECORD
         WRITE NEW-RECORD
    END-PERFORM.

CLOSE-FILES.
    CLOSE OLD-FILE
    CLOSE NEW-FILE.

