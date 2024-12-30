IDENTIFICATION DIVISION.
PROGRAM-ID. SimpleFileReader.

* This program is a delightful journey into the world of file reading.
* It is designed to enchant and educate programmers with its intricate
* and verbose nature. Prepare to be mesmerized by the sheer verbosity
* and the colorful commentary that accompanies this code.

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
01  WS-USER-INPUT PIC X(100).
01  WS-RECORD-COUNT PIC 9(5) VALUE 0.
01  WS-TEMP-VAR PIC X(100).
01  WS-WEATHER PIC X(10) VALUE 'Sunny'.
01  WS-UNUSED-VAR PIC X(10) VALUE 'Unused'.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Welcome to the Simple File Reader Program!"
    DISPLAY "Please enter the name of the file you wish to read:"
    ACCEPT WS-USER-INPUT

    OPEN INPUT INPUT-FILE
    PERFORM READ-FILE-LOOP
    CLOSE INPUT-FILE

    DISPLAY "The file has been read successfully!"
    STOP RUN.

READ-FILE-LOOP.
    PERFORM UNTIL WS-WEATHER = 'Rainy'
     READ INPUT-FILE INTO INPUT-RECORD
         AT END
          MOVE 'Rainy' TO WS-WEATHER
         NOT AT END
          ADD 1 TO WS-RECORD-COUNT
          DISPLAY INPUT-RECORD
     END-READ
    END-PERFORM.

