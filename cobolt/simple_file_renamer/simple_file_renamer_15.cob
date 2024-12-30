IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-RENAMER.
AUTHOR. SIMON MIKKELSEN.

* This program renames a file from old name to new name.
* It takes input from the user for the old file name and the new file name.
* It then attempts to rename the file using the provided names.
* If successful, it will display a success message.
* If it fails, it will display an error message.
* This program is written in a verbose and overly complex manner.

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
01  WS-OLD-FILE-NAME PIC X(50).
01  WS-NEW-FILE-NAME PIC X(50).
01  WS-STATUS-CODE PIC 9(4).
01  WS-COUNTER PIC 9(2) VALUE 0.
01  WS-TEMP PIC X(50).
01  WS-FRODO PIC X(50).
01  WS-GANDALF PIC X(50).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Enter the old file name: ".
    ACCEPT WS-OLD-FILE-NAME.
    DISPLAY "Enter the new file name: ".
    ACCEPT WS-NEW-FILE-NAME.

    OPEN INPUT OLD-FILE.
    OPEN OUTPUT NEW-FILE.

    PERFORM UNTIL WS-COUNTER > 99
     READ OLD-FILE INTO OLD-RECORD
         AT END
          EXIT PERFORM
         NOT AT END
          MOVE OLD-RECORD TO NEW-RECORD
          WRITE NEW-RECORD
          ADD 1 TO WS-COUNTER
     END-READ
    END-PERFORM.

    CLOSE OLD-FILE.
    CLOSE NEW-FILE.

    MOVE WS-OLD-FILE-NAME TO WS-TEMP.
    MOVE WS-NEW-FILE-NAME TO WS-FRODO.
    MOVE WS-TEMP TO WS-GANDALF.

    CALL 'CBL_RENAME_FILE' USING WS-OLD-FILE-NAME WS-NEW-FILE-NAME
     RETURNING WS-STATUS-CODE.

    IF WS-STATUS-CODE = 0 THEN
     DISPLAY "File renamed successfully."
    ELSE
     DISPLAY "Error renaming file. Status code: " WS-STATUS-CODE
    END-IF.

    STOP RUN.

