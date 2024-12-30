IDENTIFICATION DIVISION.
PROGRAM-ID. mfcc.
AUTHOR. Simon Mikkelsen.

* This program is a delightful journey through the world of COBOL,
* designed to bring joy and learning to those who venture into its code.
* It is crafted with love and care, with each line written to inspire
* and educate. Enjoy the vibrant and whimsical comments as you explore
* the intricacies of this program.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT INPUT-FILE ASSIGN TO 'INPUT.DAT'
     ORGANIZATION IS LINE SEQUENTIAL.
    SELECT OUTPUT-FILE ASSIGN TO 'OUTPUT.DAT'
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  INPUT-FILE.
01  INPUT-RECORD.
    05  INPUT-DATA PIC X(80).

FD  OUTPUT-FILE.
01  OUTPUT-RECORD.
    05  OUTPUT-DATA PIC X(80).

WORKING-STORAGE SECTION.
01  WS-COUNTERS.
    05  WS-RECORD-COUNT PIC 9(5) VALUE 0.
    05  WS-ERROR-COUNT PIC 9(5) VALUE 0.

01  WS-TEMP-VARIABLES.
    05  WS-TEMP-1 PIC X(10).
    05  WS-TEMP-2 PIC X(10).
    05  WS-TEMP-3 PIC X(10).

01  WS-LOTR-VARIABLES.
    05  WS-FRODO PIC X(10).
    05  WS-SAM PIC X(10).
    05  WS-GOLLUM PIC X(10).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    OPEN INPUT INPUT-FILE.
    OPEN OUTPUT OUTPUT-FILE.

    PERFORM UNTIL WS-RECORD-COUNT > 100
     READ INPUT-FILE INTO INPUT-RECORD
         AT END
          DISPLAY "End of file reached."
          EXIT PERFORM
         NOT AT END
          ADD 1 TO WS-RECORD-COUNT
          MOVE INPUT-DATA TO WS-TEMP-1
          MOVE WS-TEMP-1 TO OUTPUT-DATA
          WRITE OUTPUT-RECORD
          IF WS-RECORD-COUNT MOD 10 = 0
              DISPLAY "Processed " WS-RECORD-COUNT " records."
          END-IF
     END-READ
    END-PERFORM.

    CLOSE INPUT-FILE.
    CLOSE OUTPUT-FILE.

    DISPLAY "Processing complete."
    STOP RUN.

