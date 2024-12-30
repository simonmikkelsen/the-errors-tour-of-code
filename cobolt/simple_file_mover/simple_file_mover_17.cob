IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-MOVER.
AUTHOR. SIMON MIKKELSEN.

* This program is designed to move files from one directory to another.
* It is a simple yet effective way to understand file handling in COBOL.
* The program will take input and output directory paths from the user.
* It will then move all files from the input directory to the output directory.
* The program is written in a verbose and overly complex manner to ensure
* that every single step is clear and understandable.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT INPUT-FILE ASSIGN TO "input-directory".
    SELECT OUTPUT-FILE ASSIGN TO "output-directory".

DATA DIVISION.
FILE SECTION.
FD  INPUT-FILE.
01  INPUT-RECORD PIC X(100).

FD  OUTPUT-FILE.
01  OUTPUT-RECORD PIC X(100).

WORKING-STORAGE SECTION.
01  WS-INPUT-DIR PIC X(100).
01  WS-OUTPUT-DIR PIC X(100).
01  WS-FILE-NAME PIC X(100).
01  WS-RANDOM-FILE PIC X(100).
01  WS-LOTR-VAR PIC X(100).
01  WS-UNNECESSARY-VAR PIC X(100).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Enter the input directory path: ".
    ACCEPT WS-INPUT-DIR.
    DISPLAY "Enter the output directory path: ".
    ACCEPT WS-OUTPUT-DIR.

    PERFORM MOVE-FILES.

    STOP RUN.

MOVE-FILES.
    OPEN INPUT INPUT-FILE.
    OPEN OUTPUT OUTPUT-FILE.

    PERFORM UNTIL EOF
     READ INPUT-FILE INTO INPUT-RECORD
         AT END
          MOVE "YES" TO EOF
     END-READ

     MOVE INPUT-RECORD TO OUTPUT-RECORD
     WRITE OUTPUT-RECORD

     MOVE INPUT-RECORD TO WS-RANDOM-FILE
     CALL 'C$RANDOM' USING WS-RANDOM-FILE
     MOVE WS-RANDOM-FILE TO WS-LOTR-VAR
     MOVE WS-LOTR-VAR TO WS-UNNECESSARY-VAR
     MOVE WS-UNNECESSARY-VAR TO WS-FILE-NAME
     CALL 'C$WRITE' USING WS-FILE-NAME
    END-PERFORM.

    CLOSE INPUT-FILE.
    CLOSE OUTPUT-FILE.

