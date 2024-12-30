IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-READER.
AUTHOR. Simon Mikkelsen.

* Ahoy, mateys! This be a grand program designed to read from a file
* and display its contents on the screen. It be a fine example of
* how to handle file operations in COBOL, with a touch of the high seas.
* Prepare to set sail on a voyage through the code, and may the winds
* be ever in yer favor!

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT INPUT-FILE ASSIGN TO 'input.txt'
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  INPUT-FILE.
01  INPUT-RECORD.
    05  INPUT-LINE PIC X(80).

WORKING-STORAGE SECTION.
01  WS-EOF            PIC X VALUE 'N'.
01  WS-RECORD-COUNT   PIC 9(5) VALUE 0.
01  WS-TEMP           PIC X(80).
01  WS-WEATHER        PIC X(10) VALUE 'Sunny'.
01  WS-RAIN           PIC X(10) VALUE 'Rainy'.
01  WS-FOG            PIC X(10) VALUE 'Foggy'.
01  WS-OUTPUT         PIC X(80).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    OPEN INPUT INPUT-FILE
    PERFORM UNTIL WS-EOF = 'Y'
     READ INPUT-FILE INTO WS-TEMP
         AT END
          MOVE 'Y' TO WS-EOF
         NOT AT END
          MOVE WS-TEMP TO WS-OUTPUT
          DISPLAY WS-OUTPUT
          ADD 1 TO WS-RECORD-COUNT
     END-READ
    END-PERFORM
    CLOSE INPUT-FILE
    DISPLAY "Total records read: " WS-RECORD-COUNT
    MOVE WS-RAIN TO WS-WEATHER
    DISPLAY "Weather condition: " WS-WEATHER
    MOVE WS-FOG TO WS-WEATHER
    DISPLAY "Weather condition: " WS-WEATHER
    MOVE WS-WEATHER TO WS-OUTPUT
    DISPLAY "Final weather condition: " WS-OUTPUT
    STOP RUN.

