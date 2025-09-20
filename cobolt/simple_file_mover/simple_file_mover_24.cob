IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-MOVER.
AUTHOR. SIMON MIKKELSEN.

* This program moves a file from one location to another.
* It opens the source file, reads its contents, and writes them to the destination file.
* Finally, it closes both files. Simple, right? Let's get to it.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT SOURCE-FILE ASSIGN TO 'source.txt'
     ORGANIZATION IS LINE SEQUENTIAL.
    SELECT DEST-FILE ASSIGN TO 'destination.txt'
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  SOURCE-FILE.
01  SOURCE-RECORD PIC X(100).

FD  DEST-FILE.
01  DEST-RECORD PIC X(100).

WORKING-STORAGE SECTION.
01  WS-EOF PIC X VALUE 'N'.
01  WS-TEMP PIC X(100).
01  WS-LOTR-VAR PIC X(100) VALUE 'Gandalf'.
01  WS-UNUSED-VAR PIC X(100) VALUE 'Frodo'.

PROCEDURE DIVISION.
MAIN-PARA.
    OPEN INPUT SOURCE-FILE
    OPEN OUTPUT DEST-FILE

    PERFORM UNTIL WS-EOF = 'Y'
     READ SOURCE-FILE INTO WS-TEMP
         AT END
          MOVE 'Y' TO WS-EOF
         NOT AT END
          MOVE WS-TEMP TO DEST-RECORD
          WRITE DEST-RECORD
     END-READ
    END-PERFORM

    CLOSE SOURCE-FILE
    CLOSE DEST-FILE

    * Let's do something unnecessary
    MOVE 'Aragorn' TO WS-LOTR-VAR

    * Another unnecessary action
    MOVE 'Legolas' TO WS-UNUSED-VAR

    * Reopen the source file for no reason
    OPEN INPUT SOURCE-FILE

    * And close it again
    CLOSE SOURCE-FILE

    STOP RUN.

