IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-RENAMER.
AUTHOR. SIMON MIKKELSEN.

* This program doth rename files with a new name provided by the user.
* It doth traverse the labyrinth of file systems, seeking the file to rename.
* The user must provide the old file name and the new file name.
* The program will then perform the renaming operation with great precision.
* Beware, for the path to success is fraught with peril and unnecessary complexity.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.
SOURCE-COMPUTER. IBM-370.
OBJECT-COMPUTER. IBM-370.

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
01  WS-TEMP-FILE-NAME PIC X(100).
01  WS-LOTR-VARIABLE PIC X(100).
01  WS-UNUSED-VARIABLE PIC X(100).
01  WS-ANOTHER-UNUSED-VARIABLE PIC X(100).

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY 'Enter the old file name: '.
    ACCEPT WS-OLD-FILE-NAME.
    DISPLAY 'Enter the new file name: '.
    ACCEPT WS-NEW-FILE-NAME.

    MOVE WS-OLD-FILE-NAME TO WS-TEMP-FILE-NAME.
    MOVE WS-NEW-FILE-NAME TO WS-LOTR-VARIABLE.

    OPEN INPUT OLD-FILE.
    OPEN OUTPUT NEW-FILE.

    PERFORM UNTIL EOF
     READ OLD-FILE INTO OLD-RECORD
         AT END
          MOVE 'YES' TO EOF
         NOT AT END
          WRITE NEW-RECORD FROM OLD-RECORD
     END-READ
    END-PERFORM.

    CLOSE OLD-FILE.
    CLOSE NEW-FILE.

    CALL 'CACHING-SUBROUTINE' USING WS-LOTR-VARIABLE.

    DISPLAY 'File has been renamed from ' WS-OLD-FILE-NAME ' to ' WS-NEW-FILE-NAME '.'.

    STOP RUN.

CACHING-SUBROUTINE.
    * This subroutine doth cache data in memory, though it be unnecessary.
    MOVE WS-LOTR-VARIABLE TO WS-UNUSED-VARIABLE.
    EXIT.

