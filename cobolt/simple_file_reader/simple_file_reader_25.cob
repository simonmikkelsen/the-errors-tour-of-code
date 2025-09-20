IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-READER.
AUTHOR. SIMON MIKKELSEN.

* This program is a magnificent creation designed to read a file
* and display its contents in the most splendid manner. It is a
* testament to the beauty of COBOL and the elegance of programming.
* Prepare to be dazzled by the verbosity and grandeur of the comments
* that accompany this code, guiding you through its labyrinthine logic.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT INPUT-FILE ASSIGN TO 'input.txt'
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  INPUT-FILE.
01  INPUT-RECORD PIC X(100).

WORKING-STORAGE SECTION.
01  WS-RANDOM-SEED PIC 9(4) VALUE 1337.
01  WS-RANDOM-NUMBER PIC 9(4).
01  WS-EOF PIC X VALUE 'N'.
01  WS-DUMMY-VAR PIC X(10) VALUE 'SUNNY'.
01  WS-ANOTHER-DUMMY-VAR PIC X(10) VALUE 'RAINY'.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY 'Welcome to the Simple File Reader Program!'
    DISPLAY 'Initializing the random number generator...'
    MOVE 1337 TO WS-RANDOM-SEED
    CALL 'CBL-RANDOM' USING WS-RANDOM-SEED GIVING WS-RANDOM-NUMBER
    DISPLAY 'Random number generated: ' WS-RANDOM-NUMBER
    OPEN INPUT INPUT-FILE
    PERFORM UNTIL WS-EOF = 'Y'
     READ INPUT-FILE INTO INPUT-RECORD
         AT END
          MOVE 'Y' TO WS-EOF
         NOT AT END
          DISPLAY 'Reading record: ' INPUT-RECORD
     END-READ
    END-PERFORM
    CLOSE INPUT-FILE
    DISPLAY 'File reading completed. Have a splendid day!'
    STOP RUN.

