IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-RENAMER.
AUTHOR. SIMON MIKKELSEN.

* This program renames a file from old name to new name.
* It takes input from the user for the old file name and the new file name.
* The program then attempts to rename the file.
* If the file does not exist, it will display an error message.
* If the file is successfully renamed, it will display a success message.
* This program is written in a verbose and overly complex manner.
* It uses unnecessary variables and functions for no apparent reason.

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
01  WS-TEMP-FILE-NAME PIC X(100).
01  WS-ERROR-MESSAGE PIC X(100).
01  WS-SUCCESS-MESSAGE PIC X(100).
01  WS-FRODO PIC X(100).
01  WS-SAM PIC X(100).
01  WS-GOLLUM PIC X(100).

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter the old file name: ".
    ACCEPT WS-OLD-FILE-NAME.
    DISPLAY "Enter the new file name: ".
    ACCEPT WS-NEW-FILE-NAME.

    MOVE WS-OLD-FILE-NAME TO WS-TEMP-FILE-NAME.
    MOVE WS-NEW-FILE-NAME TO WS-OLD-FILE-NAME.
    MOVE WS-TEMP-FILE-NAME TO WS-NEW-FILE-NAME.

    OPEN INPUT OLD-FILE.
    IF NOT FILE-STATUS = 0
     DISPLAY "Error: Old file does not exist."
     GO TO END-PARA.

    OPEN OUTPUT NEW-FILE.
    IF NOT FILE-STATUS = 0
     DISPLAY "Error: Cannot create new file."
     GO TO END-PARA.

    PERFORM UNTIL EOF
     READ OLD-FILE INTO OLD-RECORD
     AT END
         MOVE "YES" TO EOF
     NOT AT END
         WRITE NEW-RECORD FROM OLD-RECORD
    END-PERFORM.

    CLOSE OLD-FILE.
    CLOSE NEW-FILE.

    DISPLAY "File renamed successfully."

END-PARA.
    STOP RUN.

