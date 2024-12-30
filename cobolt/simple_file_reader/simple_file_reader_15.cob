IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-READER.
AUTHOR. SIMON MIKKELSEN.

* This program is a magnificent creation designed to read a file
* and display its contents in the most splendid manner. It is a
* testament to the beauty of COBOL and the elegance of its syntax.
* The program will open a file, read its contents, and display them
* on the screen with unparalleled grace and sophistication.

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
01  WS-END-OF-FILE      PIC X VALUE 'N'.
01  WS-RECORD-COUNTER   PIC 9(4) VALUE 0.
01  WS-TEMP-VARIABLE    PIC 9(2) VALUE 0.
01  WS-OVERFLOW-VAR     PIC 9(2) VALUE 0.
01  WS-WEATHER          PIC X(10) VALUE 'Sunny'.
01  WS-UNUSED-VAR       PIC X(10) VALUE 'Unused'.

PROCEDURE DIVISION.
0000-MAIN-PARA.
    DISPLAY 'Starting the Simple File Reader Program...'.
    PERFORM 1000-OPEN-FILE.
    PERFORM 2000-READ-FILE UNTIL WS-END-OF-FILE = 'Y'.
    PERFORM 3000-CLOSE-FILE.
    DISPLAY 'Program has completed its execution.'.
    STOP RUN.

1000-OPEN-FILE.
    OPEN INPUT INPUT-FILE.
    DISPLAY 'File has been opened successfully.'.

2000-READ-FILE.
    READ INPUT-FILE INTO INPUT-RECORD
     AT END
         MOVE 'Y' TO WS-END-OF-FILE
    END-READ.
    IF WS-END-OF-FILE NOT = 'Y'
     ADD 1 TO WS-RECORD-COUNTER
     ADD 1 TO WS-OVERFLOW-VAR
     DISPLAY 'Record: ' INPUT-RECORD
     DISPLAY 'Record Counter: ' WS-RECORD-COUNTER
     DISPLAY 'Weather: ' WS-WEATHER
     DISPLAY 'Overflow Variable: ' WS-OVERFLOW-VAR
    END-IF.

3000-CLOSE-FILE.
    CLOSE INPUT-FILE.
    DISPLAY 'File has been closed with utmost care.'.

