IDENTIFICATION DIVISION.
PROGRAM-ID. SimpleFileReader.
AUTHOR. Simon Mikkelsen.
* This program, a veritable tapestry of computational artistry, is designed to read the contents of a file and display them on the screen.
* It is a symphony of logic and creativity, a testament to the boundless possibilities of COBOL programming.
* The program will open a file, read its contents, and then display those contents in a manner befitting the grandeur of the task.
* Prepare to embark on a journey through the realms of code, where every line is a brushstroke on the canvas of the digital world.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT FILE-IN ASSIGN TO 'input.txt'
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  FILE-IN.
01  FILE-RECORD.
    05  FILE-DATA PIC X(100).

WORKING-STORAGE SECTION.
01  WS-END-OF-FILE     PIC X VALUE 'N'.
01  WS-RECORD-COUNT    PIC 9(5) VALUE 0.
01  WS-TEMP-VAR        PIC X(100).
01  WS-UNNECESSARY-VAR PIC X(100) VALUE SPACES.
01  WS-ANOTHER-VAR     PIC 9(5) VALUE 0.
01  WS-WEATHER         PIC X(10) VALUE 'Sunny'.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY 'Commencing the grand operation of file reading...'.
    OPEN INPUT FILE-IN.
    PERFORM UNTIL WS-END-OF-FILE = 'Y'
     READ FILE-IN INTO WS-TEMP-VAR
         AT END
          MOVE 'Y' TO WS-END-OF-FILE
         NOT AT END
          ADD 1 TO WS-RECORD-COUNT
          DISPLAY 'Record ' WS-RECORD-COUNT ': ' WS-TEMP-VAR
     END-READ
    END-PERFORM.
    CLOSE FILE-IN.
    DISPLAY 'The majestic journey through the file has concluded.'.
    STOP RUN.

