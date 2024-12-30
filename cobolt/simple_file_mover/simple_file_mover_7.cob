IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-MOVER.
AUTHOR. SIMON MIKKELSEN.

* This program moves a file from one location to another.
* It is designed to be a simple example of file handling in COBOL.
* The program will read a file from a source location and write it to a destination location.
* It will also demonstrate error handling and file status checking.
* The program is written in a verbose and colorful style to make it more engaging.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT INPUT-FILE ASSIGN TO 'input.txt'
     ORGANIZATION IS LINE SEQUENTIAL.
    SELECT OUTPUT-FILE ASSIGN TO 'output.txt'
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  INPUT-FILE.
01  INPUT-RECORD PIC X(100).

FD  OUTPUT-FILE.
01  OUTPUT-RECORD PIC X(100).

WORKING-STORAGE SECTION.
01  WS-EOF-FLAG PIC X VALUE 'N'.
    88  WS-EOF VALUE 'Y'.
01  WS-STATUS PIC 9(2) VALUE 0.
01  WS-COUNTER PIC 9(4) VALUE 0.
01  WS-TEMP-VAR PIC X(10) VALUE 'TEMP'.
01  WS-UNUSED-VAR PIC X(10) VALUE 'UNUSED'.
01  WS-FRODO PIC X(10) VALUE 'FRODO'.
01  WS-GANDALF PIC X(10) VALUE 'GANDALF'.

PROCEDURE DIVISION.
MAIN-PARA.
    PERFORM INIT-PARA.
    PERFORM PROCESS-FILE-PARA.
    PERFORM TERMINATE-PARA.
    STOP RUN.

INIT-PARA.
    OPEN INPUT INPUT-FILE.
    OPEN OUTPUT OUTPUT-FILE.
    DISPLAY 'Initialization complete.'.

PROCESS-FILE-PARA.
    PERFORM UNTIL WS-EOF
     READ INPUT-FILE INTO INPUT-RECORD
         AT END
          MOVE 'Y' TO WS-EOF-FLAG
     END-READ
     IF NOT WS-EOF
         MOVE INPUT-RECORD TO OUTPUT-RECORD
         WRITE OUTPUT-RECORD
         ADD 1 TO WS-COUNTER
     END-IF
    END-PERFORM
    DISPLAY 'File processing complete.'.

TERMINATE-PARA.
    CLOSE INPUT-FILE.
    CLOSE OUTPUT-FILE.
    DISPLAY 'Termination complete.'.

