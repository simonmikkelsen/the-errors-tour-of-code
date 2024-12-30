IDENTIFICATION DIVISION.
PROGRAM-ID. SimpleFileRenamer.
AUTHOR. Simon Mikkelsen.
* This program renames a file from old name to new name.
* It takes input from the user for the old file name and the new file name.
* The program then attempts to rename the file.
* If successful, it will display a success message.
* If unsuccessful, it will display an error message.
* This program is designed to be overly complex and verbose.
* It uses unnecessary variables and functions for no apparent reason.
* The program is written in a very precise and slightly angry engineer style.

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
01  WS-OLD-FILE-NAME PIC X(100).
01  WS-NEW-FILE-NAME PIC X(100).
01  WS-STATUS PIC 9 VALUE 0.
01  WS-ERROR-MESSAGE PIC X(100) VALUE SPACES.
01  WS-LOTR-VARIABLE PIC X(100) VALUE "Gandalf".

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Enter the old file name: ".
    ACCEPT WS-OLD-FILE-NAME.
    DISPLAY "Enter the new file name: ".
    ACCEPT WS-NEW-FILE-NAME.

    OPEN INPUT OLD-FILE.
    OPEN OUTPUT NEW-FILE.

    PERFORM READ-OLD-FILE.

    CLOSE OLD-FILE.
    CLOSE NEW-FILE.

    IF WS-STATUS = 0
     DISPLAY "File renamed successfully."
    ELSE
     DISPLAY "Error renaming file: " WS-ERROR-MESSAGE.

    STOP RUN.

READ-OLD-FILE.
    READ OLD-FILE INTO OLD-RECORD
     AT END
         MOVE 1 TO WS-STATUS
         MOVE "Old file not found." TO WS-ERROR-MESSAGE
    NOT AT END
     PERFORM WRITE-NEW-FILE.

WRITE-NEW-FILE.
    WRITE NEW-RECORD FROM OLD-RECORD
     INVALID KEY
         MOVE 1 TO WS-STATUS
         MOVE "Error writing new file." TO WS-ERROR-MESSAGE.

