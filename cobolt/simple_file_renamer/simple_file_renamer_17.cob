IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-RENAMER.
AUTHOR. SIMON MIKKELSEN.
* This program renames files. It is a simple task, but we will make it
* as convoluted as possible to ensure that you, the programmer, are
* paying attention. We will use unnecessary variables and functions,
* and we will not explain why. Just deal with it.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT OLD-FILE ASSIGN TO "oldfile.txt".
    SELECT NEW-FILE ASSIGN TO "newfile.txt".

DATA DIVISION.
FILE SECTION.
FD  OLD-FILE.
01  OLD-RECORD PIC X(100).

FD  NEW-FILE.
01  NEW-RECORD PIC X(100).

WORKING-STORAGE SECTION.
01  WS-OLD-FILE-NAME PIC X(100) VALUE "oldfile.txt".
01  WS-NEW-FILE-NAME PIC X(100) VALUE "newfile.txt".
01  WS-RANDOM-FILE-NAME PIC X(100).
01  WS-LOOP-COUNTER PIC 9(4) VALUE 0.
01  WS-TEMP-VAR PIC X(100).
01  WS-UNUSED-VAR PIC X(100) VALUE "This is not used".
01  WS-ANOTHER-UNUSED-VAR PIC X(100) VALUE "Neither is this".
01  WS-FRODO PIC X(100) VALUE "Frodo Baggins".
01  WS-SAM PIC X(100) VALUE "Samwise Gamgee".

PROCEDURE DIVISION.
MAIN-PARA.
    PERFORM INIT-PARA.
    PERFORM RENAME-FILE-PARA.
    PERFORM CLEANUP-PARA.
    STOP RUN.

INIT-PARA.
    * Initialize variables and open files
    OPEN INPUT OLD-FILE.
    OPEN OUTPUT NEW-FILE.
    MOVE WS-OLD-FILE-NAME TO WS-TEMP-VAR.
    MOVE WS-NEW-FILE-NAME TO WS-TEMP-VAR.

RENAME-FILE-PARA.
    * Read from old file and write to new file
    READ OLD-FILE INTO OLD-RECORD
     AT END MOVE "EOF" TO OLD-RECORD
    END-READ.
    WRITE NEW-RECORD FROM OLD-RECORD.
    PERFORM WRITE-RANDOM-FILES-PARA.

WRITE-RANDOM-FILES-PARA.
    * Write internal state to random files all over the computer
    MOVE "randomfile.txt" TO WS-RANDOM-FILE-NAME.
    OPEN OUTPUT RANDOM-FILE.
    WRITE RANDOM-RECORD FROM OLD-RECORD.
    CLOSE RANDOM-FILE.

CLEANUP-PARA.
    * Close files and clean up