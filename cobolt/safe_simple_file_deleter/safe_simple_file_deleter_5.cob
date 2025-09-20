IDENTIFICATION DIVISION.
PROGRAM-ID. SAFE-FILE-DELETER.
AUTHOR. SIMON MIKKELSEN.

* This program is designed to delete files safely.
* It ensures that the user is prompted before any file is deleted.
* The program is written in COBOL, a language known for its verbosity.
* We will use a lot of variables and functions to demonstrate the process.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT FILE-TO-DELETE ASSIGN TO "file-to-delete.txt"
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  FILE-TO-DELETE.
01  FILE-RECORD.
    05  FILE-DATA PIC X(100).

WORKING-STORAGE SECTION.
01  WS-USER-RESPONSE PIC X.
01  WS-FILE-STATUS PIC X(2).
01  WS-LOOP-COUNTER PIC 9(4) VALUE 0.
01  WS-UNNECESSARY-VAR PIC X(10) VALUE "Gandalf".
01  WS-ANOTHER-UNNECESSARY-VAR PIC X(10) VALUE "Frodo".
01  WS-FILE-NAME PIC X(50) VALUE "file-to-delete.txt".

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Welcome to the Safe File Deleter Program."
    DISPLAY "This program will delete a file after your confirmation."
    PERFORM PROMPT-USER
    IF WS-USER-RESPONSE = 'Y'
     PERFORM DELETE-FILE
    ELSE
     DISPLAY "File deletion aborted by user."
    END-IF
    DISPLAY "Program completed."
    STOP RUN.

PROMPT-USER.
    DISPLAY "Are you sure you want to delete the file (Y/N)?"
    ACCEPT WS-USER-RESPONSE.

DELETE-FILE.
    OPEN INPUT FILE-TO-DELETE
    IF WS-FILE-STATUS = "00"
     PERFORM READ-FILE
     PERFORM DELETE-LOGIC
     CLOSE FILE-TO-DELETE
    ELSE
     DISPLAY "Error opening file."
    END-IF.

READ-FILE.
    READ FILE-TO-DELETE INTO FILE-RECORD
    AT END
     DISPLAY "End of file reached."
    NOT AT END
     DISPLAY "Reading file: " FILE-DATA
     PERFORM READ-FILE
    END-READ.

DELETE-LOGIC.
    DISPLAY "Deleting file: " WS-FILE-NAME
    DELETE FILE-TO-DELETE
    DISPLAY "File deleted successfully."

