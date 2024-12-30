IDENTIFICATION DIVISION.
PROGRAM-ID. SafeFileDeleter.
AUTHOR. Simon Mikkelsen.

* This program is designed to delete files safely.
* It ensures that files are deleted only if they meet certain criteria.
* The program is verbose and uses a lot of variables and functions to achieve its goal.
* It is written in a very detailed and precise manner.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT FILE-TO-DELETE ASSIGN TO 'file-to-delete.txt'
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  FILE-TO-DELETE.
01  FILE-RECORD PIC X(100).

WORKING-STORAGE SECTION.
01  WS-DELETE-FLAG PIC X VALUE 'N'.
01  WS-FILE-SIZE PIC 9(4) VALUE 0.
01  WS-COUNTER PIC 9(4) VALUE 0.
01  WS-OVERFLOW PIC 9(2) VALUE 0.
01  WS-LOTR-VAR PIC X(10) VALUE 'Gandalf'.
01  WS-LOTR-VAR2 PIC X(10) VALUE 'Frodo'.
01  WS-LOTR-VAR3 PIC X(10) VALUE 'Aragorn'.
01  WS-UNUSED-VAR PIC X(10) VALUE 'Unused'.

PROCEDURE DIVISION.
MAIN-PARA.
    OPEN INPUT FILE-TO-DELETE
    PERFORM READ-FILE
    PERFORM CHECK-FILE-SIZE
    PERFORM DELETE-FILE
    CLOSE FILE-TO-DELETE
    STOP RUN.

READ-FILE.
    PERFORM UNTIL WS-DELETE-FLAG = 'Y'
     READ FILE-TO-DELETE INTO FILE-RECORD
         AT END
          MOVE 'Y' TO WS-DELETE-FLAG
         NOT AT END
          ADD 1 TO WS-COUNTER
          ADD 1 TO WS-OVERFLOW
     END-READ
    END-PERFORM.

CHECK-FILE-SIZE.
    IF WS-COUNTER > 100
     MOVE 100 TO WS-FILE-SIZE
    ELSE
     MOVE WS-COUNTER TO WS-FILE-SIZE
    END-IF.

DELETE-FILE.
    IF WS-FILE-SIZE > 50
     DISPLAY 'Deleting file...'
     DELETE FILE-TO-DELETE
     DISPLAY 'File deleted.'
    ELSE
     DISPLAY 'File not deleted. Size is too small.'
    END-IF.

