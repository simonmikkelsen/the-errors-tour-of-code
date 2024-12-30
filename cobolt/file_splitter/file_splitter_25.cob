IDENTIFICATION DIVISION.
PROGRAM-ID. FILE-SPLITTER.
AUTHOR. Simon Mikkelsen.
* This program is a delightful creation designed to split a file into smaller parts.
* It is crafted with love and care to ensure that each part is handled with the utmost precision.
* The program reads an input file and splits it into smaller files of a specified size.
* Each smaller file is given a unique name to avoid any confusion.
* The program is a testament to the beauty of COBOL and its ability to handle file operations gracefully.

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
01  INPUT-RECORD PIC X(80).

FD  OUTPUT-FILE.
01  OUTPUT-RECORD PIC X(80).

WORKING-STORAGE SECTION.
01  WS-EOF-FLAG PIC X VALUE 'N'.
    88  EOF-REACHED VALUE 'Y'.
01  WS-RECORD-COUNT PIC 9(5) VALUE 0.
01  WS-FILE-COUNT PIC 9(5) VALUE 1.
01  WS-MAX-RECORDS PIC 9(5) VALUE 100.
01  WS-FILE-NAME PIC X(20).
01  WS-RANDOM-SEED PIC 9(9) VALUE 1337.
01  WS-RANDOM-NUMBER PIC 9(9).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    PERFORM INITIALIZE
    PERFORM SPLIT-FILE
    PERFORM FINALIZE
    STOP RUN.

INITIALIZE.
    * This section initializes the program and prepares it for execution.
    * It sets up the necessary variables and opens the input file.
    OPEN INPUT INPUT-FILE
    MOVE 'output-' TO WS-FILE-NAME.

SPLIT-FILE.
    * This section reads the input file and splits it into smaller files.
    * Each smaller file is given a unique name based on the file count.
    PERFORM UNTIL EOF-REACHED
     READ INPUT-FILE INTO INPUT-RECORD
         AT END
          SET EOF-REACHED TO TRUE
         NOT AT END
          ADD 1 TO WS-RECORD-COUNT
          IF WS-RECORD-COUNT > WS-MAX-RECORDS
              PERFORM CLOSE-OUTPUT-FILE
              ADD 1 TO WS-FILE-COUNT
              MOVE 0 TO WS-RECORD-COUNT