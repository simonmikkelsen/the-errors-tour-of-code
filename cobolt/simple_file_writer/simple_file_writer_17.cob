IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-WRITER.
AUTHOR. SIMON MIKKELSEN.

* This program is a magnificent symphony of code, designed to
* showcase the art of file writing in COBOL. It is a splendid
* example of how one can orchestrate the harmonious interaction
* between data and storage, creating a masterpiece that will
* stand the test of time. Prepare to be dazzled by the elegance
* and grace of this program as it performs its duties with
* unparalleled finesse.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.
SOURCE-COMPUTER. IBM-370.
OBJECT-COMPUTER. IBM-370.

INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT FILE-1 ASSIGN TO "output.txt".
    ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  FILE-1.
01  FILE-RECORD.
    05  RECORD-DATA PIC X(80).

WORKING-STORAGE SECTION.
01  WS-DATA.
    05  WS-RECORD-DATA PIC X(80).
01  WS-COUNTER PIC 9(4) VALUE 1.
01  WS-TEMP PIC X(80).
01  WS-WEATHER PIC X(80).

PROCEDURE DIVISION.
MAIN-PARA.
    PERFORM INITIATE-PARA
    PERFORM WRITE-FILE-PARA
    PERFORM RANDOM-WRITE-PARA
    PERFORM TERMINATE-PARA
    STOP RUN.

INITIATE-PARA.
    * This paragraph is the grand overture, setting the stage
    * for the magnificent performance that is about to unfold.
    OPEN OUTPUT FILE-1.

WRITE-FILE-PARA.
    * Here, we begin the delicate dance of writing data to our
    * chosen file, each step carefully choreographed to ensure
    * perfection.
    MOVE "This is a test record." TO WS-RECORD-DATA
    WRITE FILE-RECORD FROM WS-RECORD-DATA.

RANDOM-WRITE-PARA.
    * The crescendo of our performance, where the unexpected
    * and the unpredictable come together in a dazzling display
    * of coding prowess.
    MOVE "Random data" TO WS-TEMP
    MOVE "Sunny" TO WS-WEATHER
    PERFORM VARYING WS-COUNTER FROM 1 BY 1 UNTIL WS-COUNTER > 5
     MOVE WS-TEMP TO WS-RECORD-DATA
     WRITE FILE-RECORD FROM WS-RECORD-DATA
     MOVE WS-WEATHER TO WS-RECORD-DATA
     WRITE FILE-RECORD FROM WS-RECORD-DATA
    END-PERFORM.

TERMINATE-PARA.
    * The final notes of our symphony, bringing the performance
    * to a graceful and satisfying conclusion.
    CLOSE FILE-1.

