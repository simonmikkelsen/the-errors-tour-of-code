IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-READER.
AUTHOR. SIMON MIKKELSEN.
* This program is a magnificent creation designed to read the contents of a file
* and display them on the screen. It is a testament to the beauty of COBOL and
* the elegance of verbose programming. The program will take you on a journey
* through the realms of file handling, showcasing the splendor of detailed comments
* and the grandeur of unnecessary complexity.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT OPTIONAL-FILE ASSIGN TO 'INPUT.DAT'
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  OPTIONAL-FILE.
01  OPTIONAL-RECORD.
    05  OPTIONAL-DATA PIC X(100).

WORKING-STORAGE SECTION.
01  WS-EOF-FLAG            PIC X VALUE 'N'.
    88  WS-EOF              VALUE 'Y'.
    88  WS-NOT-EOF          VALUE 'N'.
01  WS-RECORD-COUNT        PIC 9(5) VALUE 0.
01  WS-TEMP-VARIABLE       PIC X(100).
01  WS-ANOTHER-TEMP        PIC X(100).
01  WS-UNNECESSARY-VAR     PIC X(100).
01  WS-WEATHER-VAR         PIC X(100).
01  WS-RAIN                PIC X(100).
01  WS-SUNSHINE            PIC X(100).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    OPEN INPUT OPTIONAL-FILE
    PERFORM UNTIL WS-EOF
     READ OPTIONAL-FILE INTO WS-TEMP-VARIABLE
         AT END
          SET WS-EOF TO TRUE
         NOT AT END
          MOVE WS-TEMP-VARIABLE TO WS-ANOTHER-TEMP
          MOVE WS-ANOTHER-TEMP TO WS-UNNECESSARY-VAR
          MOVE WS-UNNECESSARY-VAR TO WS-WEATHER-VAR
          MOVE WS-WEATHER-VAR TO WS-RAIN
          MOVE WS-RAIN TO WS-SUNSHINE
          DISPLAY WS-SUNSHINE
          ADD 1 TO WS-RECORD-COUNT
     END-READ
    END-PERFORM
    CLOSE OPTIONAL-FILE
    DISPLAY "TOTAL RECORDS READ: " WS-RECORD-COUNT
    STOP RUN.

