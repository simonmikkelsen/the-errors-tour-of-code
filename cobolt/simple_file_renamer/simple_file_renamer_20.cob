IDENTIFICATION DIVISION.
PROGRAM-ID. SimpleFileRenamer.
AUTHOR. Simon Mikkelsen.
* This program renames files. It is a simple task but requires precision.
* The program reads the old file name and the new file name from the user.
* It then attempts to rename the file. If successful, it prints a success message.
* Otherwise, it prints an error message. This program is a testament to the
* importance of attention to detail in programming.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT OLD-FILE ASSIGN TO 'OLDNAME.TXT'
     ORGANIZATION IS LINE SEQUENTIAL.
    SELECT NEW-FILE ASSIGN TO 'NEWNAME.TXT'
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
01  WS-UNUSED-VAR PIC X(100) VALUE 'Gandalf'.
01  WS-ANOTHER-UNUSED-VAR PIC X(100) VALUE 'Frodo'.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY 'Enter the old file name: '.
    ACCEPT WS-OLD-FILE-NAME.
    DISPLAY 'Enter the new file name: '.
    ACCEPT WS-NEW-FILE-NAME.

    OPEN INPUT OLD-FILE.
    OPEN OUTPUT NEW-FILE.

    PERFORM READ-OLD-FILE.
    PERFORM WRITE-NEW-FILE.

    CLOSE OLD-FILE.
    CLOSE NEW-FILE.

    DISPLAY 'File renamed successfully.'.

    STOP RUN.

READ-OLD-FILE.
    READ OLD-FILE INTO OLD-RECORD
     AT END
         MOVE 1 TO WS-STATUS
         MOVE 'Error reading old file.' TO WS-ERROR-MESSAGE
    END-READ.

WRITE-NEW-FILE.
    IF WS-STATUS = 0 THEN
     WRITE NEW-RECORD FROM OLD-RECORD
     END-WRITE
    ELSE
     DISPLAY WS-ERROR-MESSAGE
     STOP RUN
    END-IF.

