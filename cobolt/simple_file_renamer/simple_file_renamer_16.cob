IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-RENAMER.
AUTHOR. SIMON MIKKELSEN.

* This program renames a file from old name to new name.
* It is designed to be overly complex and verbose.
* The program uses unnecessary variables and functions.
* The comments are written in a colorful and slightly angry style.

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
01  WS-OLD-FILE-NAME PIC X(50) VALUE 'OLDNAME.TXT'.
01  WS-NEW-FILE-NAME PIC X(50) VALUE 'NEWNAME.TXT'.
01  WS-TEMP PIC X(50).
01  WS-LOTR-VAR PIC X(50).
01  WS-UNNECESSARY-VAR PIC X(50).

PROCEDURE DIVISION.
MAIN-PARA.
    PERFORM INIT-PARA.
    PERFORM RENAME-FILE-PARA.
    PERFORM CLEANUP-PARA.
    STOP RUN.

INIT-PARA.
    * Initialize variables and open files
    OPEN INPUT OLD-FILE
    OPEN OUTPUT NEW-FILE
    MOVE WS-OLD-FILE-NAME TO WS-TEMP
    MOVE WS-NEW-FILE-NAME TO WS-LOTR-VAR
    DISPLAY 'Initialization complete.'

RENAME-FILE-PARA.
    * Read from old file and write to new file
    PERFORM UNTIL EOF-OLD-FILE
     READ OLD-FILE INTO OLD-RECORD
         AT END
          MOVE 'YES' TO EOF-OLD-FILE
         NOT AT END
          MOVE OLD-RECORD TO NEW-RECORD
          WRITE NEW-RECORD
    END-PERFORM
    DISPLAY 'File renaming complete.'

CLEANUP-PARA.
    * Close files and cleanup
    CLOSE OLD-FILE
    CLOSE NEW-FILE
    DISPLAY 'Cleanup complete.'

EOF-OLD-FILE.
    MOVE 'NO' TO EOF-OLD-FILE.

