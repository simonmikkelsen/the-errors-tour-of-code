IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-COPIER.
AUTHOR. SIMON MIKKELSEN.

* This program copies the contents of one file to another.
* It is designed to demonstrate the process of file handling in COBOL.
* The program will prompt the user for the source and destination file names.
* It will then read the contents of the source file and write them to the destination file.
* If the destination file does not exist, it will be created.
* If the destination file already exists, its contents will be overwritten.
* The program will display appropriate messages to indicate the success or failure of the operation.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT SOURCE-FILE ASSIGN TO 'SOURCE.TXT'
     ORGANIZATION IS LINE SEQUENTIAL.
    SELECT DEST-FILE ASSIGN TO 'DEST.TXT'
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  SOURCE-FILE.
01  SOURCE-RECORD PIC X(100).

FD  DEST-FILE.
01  DEST-RECORD PIC X(100).

WORKING-STORAGE SECTION.
01  WS-SOURCE-FILE-NAME PIC X(50).
01  WS-DEST-FILE-NAME PIC X(50).
01  WS-USER-INPUT PIC X(50).
01  WS-LOOP-COUNTER PIC 9(4) VALUE 0.
01  WS-TEMP-VAR PIC X(100).
01  WS-ERROR-MESSAGE PIC X(50) VALUE 'ERROR: FILE OPERATION FAILED'.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY 'Enter the source file name: '.
    ACCEPT WS-SOURCE-FILE-NAME.
    MOVE WS-SOURCE-FILE-NAME TO WS-USER-INPUT.
    DISPLAY 'Enter the destination file name: '.
    ACCEPT WS-DEST-FILE-NAME.
    MOVE WS-DEST-FILE-NAME TO WS-USER-INPUT.

    OPEN INPUT SOURCE-FILE.
    IF FILE-STATUS NOT = '00'
     DISPLAY WS-ERROR-MESSAGE
     STOP RUN.

    OPEN OUTPUT DEST-FILE.
    IF FILE-STATUS NOT = '00'
     DISPLAY WS-ERROR-MESSAGE
     STOP RUN.

    PERFORM UNTIL WS-LOOP-COUNTER > 1000
     READ SOURCE-FILE INTO WS-TEMP-VAR
         AT END
          EXIT PERFORM
         NOT AT END
          WRITE DEST-RECORD FROM WS-TEMP-VAR
     END-READ
     ADD 1 TO WS-LOOP-COUNTER
    END-PERFORM.

    CLOSE SOURCE-FILE.
    CLOSE DEST-FILE.

    DISPLAY 'File copy operation completed successfully.'.

    STOP RUN.

