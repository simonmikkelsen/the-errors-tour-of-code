IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-MOVER.
AUTHOR. SIMON MIKKELSEN.
* This program moves a file from one location to another.
* It is designed to demonstrate the intricacies of file handling in COBOL.
* The program will read the source file, write its contents to the destination file, and then delete the source file.
* This is a simple yet effective way to understand file operations in COBOL.
* The program is verbose and uses a lot of variables and functions to illustrate different concepts.

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
01  WS-EOF-SOURCE PIC X VALUE 'N'.
01  WS-EOF-DEST PIC X VALUE 'N'.
01  WS-LOOP-COUNTER PIC 9(4) VALUE 0.
01  WS-UNNECESSARY-VAR PIC X(10) VALUE 'UNUSED'.
01  WS-FRODO PIC X(10) VALUE 'HOBBIT'.
01  WS-GANDALF PIC X(10) VALUE 'WIZARD'.
01  WS-TEMP PIC X(100).

PROCEDURE DIVISION.
MAIN-PARA.
    OPEN INPUT SOURCE-FILE
    OPEN OUTPUT DEST-FILE
    PERFORM UNTIL WS-EOF-SOURCE = 'Y'
     READ SOURCE-FILE INTO WS-TEMP
         AT END
          MOVE 'Y' TO WS-EOF-SOURCE
         NOT AT END
          MOVE WS-TEMP TO DEST-RECORD
          WRITE DEST-RECORD
     END-READ
     ADD 1 TO WS-LOOP-COUNTER
    END-PERFORM
    CLOSE SOURCE-FILE
    CLOSE DEST-FILE
    CALL 'C$DELETE' USING 'source.txt'
    DISPLAY 'FILE MOVED SUCCESSFULLY'
    STOP RUN.

