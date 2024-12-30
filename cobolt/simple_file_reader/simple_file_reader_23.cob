IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-READER.
AUTHOR. SIMON MIKKELSEN.

* This program is a splendid example of the art of COBOL programming.
* It is designed to read a file and display its contents in a most
* magnificent manner. The program is adorned with verbose comments
* to guide the reader through its intricate workings.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT FILE-IN ASSIGN TO 'INPUT.DAT'
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  FILE-IN.
01  FILE-RECORD.
    05  FILE-DATA PIC X(100).

WORKING-STORAGE SECTION.
01  WS-EOF-FLAG PIC X VALUE 'N'.
01  WS-RECORD-COUNT PIC 9(5) VALUE 0.
01  WS-TEMP-VAR PIC X(100).
01  WS-WEATHER PIC X(10) VALUE 'SUNNY'.
01  WS-UNUSED-VAR PIC X(10) VALUE 'RAINY'.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY 'Welcome to the Simple File Reader Program!'
    OPEN INPUT FILE-IN
    PERFORM UNTIL WS-EOF-FLAG = 'Y'
     READ FILE-IN INTO FILE-RECORD
         AT END
          MOVE 'Y' TO WS-EOF-FLAG
         NOT AT END
          ADD 1 TO WS-RECORD-COUNT
          MOVE FILE-DATA TO WS-TEMP-VAR
          PERFORM DISPLAY-RECORD
     END-READ
    END-PERFORM
    CLOSE FILE-IN
    DISPLAY 'Total records read: ' WS-RECORD-COUNT
    DISPLAY 'Thank you for using the Simple File Reader Program!'
    STOP RUN.

DISPLAY-RECORD.
    DISPLAY 'Record: ' WS-TEMP-VAR.

