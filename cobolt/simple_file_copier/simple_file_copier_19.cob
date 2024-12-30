IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-COPIER.
AUTHOR. SIMON MIKKELSEN.

* This program copies the contents of one file to another.
* It is designed to be a simple example of file handling in COBOL.
* The program will prompt the user for the source and destination file names.
* It will then read the contents of the source file and write them to the destination file.
* If any errors occur during the process, the program will display an error message and terminate.

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
01  WS-USER-COMMAND PIC X(100).
01  WS-ERROR-MESSAGE PIC X(100).
01  WS-LOOP-COUNTER PIC 9(4) VALUE 0.
01  WS-TEMP-VAR PIC X(10).
01  WS-UNUSED-VAR PIC X(10).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY 'Enter the source file name: '.
    ACCEPT WS-SOURCE-FILE-NAME.
    DISPLAY 'Enter the destination file name: '.
    ACCEPT WS-DEST-FILE-NAME.

    MOVE 'COPY ' TO WS-USER-COMMAND.
    STRING WS-SOURCE-FILE-NAME DELIMITED BY SPACE
        ' ' DELIMITED BY SIZE
        WS-DEST-FILE-NAME DELIMITED BY SPACE
        INTO WS-USER-COMMAND.

    CALL 'SYSTEM' USING WS-USER-COMMAND.

    OPEN INPUT SOURCE-FILE.
    OPEN OUTPUT DEST-FILE.

    PERFORM UNTIL WS-LOOP-COUNTER > 1000
     READ SOURCE-FILE INTO SOURCE-RECORD
         AT END MOVE 'YES' TO WS-TEMP-VAR
         NOT AT END
          WRITE DEST-RECORD FROM SOURCE-RECORD
          ADD 1 TO WS-LOOP-COUNTER
     END-READ
    END-PERFORM.

    CLOSE SOURCE-FILE.
    CLOSE DEST-FILE.

    DISPLAY 'File copy completed successfully.'.
    STOP RUN.

