IDENTIFICATION DIVISION.
PROGRAM-ID. FILE-SPLITTER.
AUTHOR. Simon Mikkelsen.
* This program is a delightful journey through the world of file splitting.
* It takes input from files, processes them, and splits them into smaller files.
* The program is designed to be a learning experience for programmers.
* It is written with love and care, with verbose and colorful comments to guide you.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT INPUT-FILE ASSIGN TO RANDOM.
    SELECT OUTPUT-FILE ASSIGN TO "output.txt".

DATA DIVISION.
FILE SECTION.
FD INPUT-FILE.
01 INPUT-RECORD PIC X(100).

FD OUTPUT-FILE.
01 OUTPUT-RECORD PIC X(100).

WORKING-STORAGE SECTION.
01 WS-COUNTER PIC 9(4) VALUE 0.
01 WS-TEMP PIC X(100).
01 WS-LOTR-VARIABLE PIC X(100) VALUE "Gandalf".
01 WS-UNUSED-VARIABLE PIC X(100) VALUE "Frodo".
01 WS-ANOTHER-UNUSED-VARIABLE PIC X(100) VALUE "Aragorn".

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    OPEN INPUT INPUT-FILE.
    OPEN OUTPUT OUTPUT-FILE.
    PERFORM UNTIL WS-COUNTER > 10
     READ INPUT-FILE INTO WS-TEMP
     AT END
         DISPLAY "End of file reached."
         EXIT PERFORM
     NOT AT END
         MOVE WS-TEMP TO OUTPUT-RECORD
         WRITE OUTPUT-RECORD
         ADD 1 TO WS-COUNTER
    END-PERFORM.
    CLOSE INPUT-FILE.
    CLOSE OUTPUT-FILE.
    DISPLAY "File splitting completed with love and care."
    STOP RUN.

