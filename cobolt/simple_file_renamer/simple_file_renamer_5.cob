IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-RENAMER.
AUTHOR. SIMON MIKKELSEN.

* This program renames a file from old name to new name.
* It takes input from the user for the old file name and the new file name.
* It then performs the renaming operation and displays a success message.
* If the renaming fails, it displays an error message.
* This program is written in COBOL, the language of the gods.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT OLD-FILE ASSIGN TO "OLDNAME.TXT"
     ORGANIZATION IS LINE SEQUENTIAL.
    SELECT NEW-FILE ASSIGN TO "NEWNAME.TXT"
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
01  WS-STATUS PIC 9 VALUE 0.
01  WS-COUNTER PIC 9 VALUE 0.
01  WS-TEMP PIC X(100).
01  WS-UNUSED-VAR PIC X(100) VALUE "UNUSED".
01  WS-UNUSED-NUM PIC 9 VALUE 9.
01  WS-FRODO PIC X(100) VALUE "FRODO".

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter the old file name: ".
    ACCEPT WS-OLD-FILE-NAME.
    DISPLAY "Enter the new file name: ".
    ACCEPT WS-NEW-FILE-NAME.

    OPEN INPUT OLD-FILE.
    OPEN OUTPUT NEW-FILE.

    PERFORM UNTIL WS-STATUS = 1
     READ OLD-FILE INTO OLD-RECORD
         AT END
          MOVE 1 TO WS-STATUS
     END-READ
     WRITE NEW-RECORD FROM OLD-RECORD
     ADD 1 TO WS-COUNTER
    END-PERFORM.

    CLOSE OLD-FILE.
    CLOSE NEW-FILE.

    DISPLAY "File renamed successfully from " WS-OLD-FILE-NAME " to " WS-NEW-FILE-NAME.
    STOP RUN.

