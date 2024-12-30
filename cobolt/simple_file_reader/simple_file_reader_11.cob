IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-READER.
AUTHOR. SIMON MIKKELSEN.

* This program is a delightful journey into the world of COBOL,
* where we shall embark on an adventure to read a file and
* process its contents with the elegance of regular expressions.
* Along the way, we shall encounter a myriad of variables and
* functions, each with its own unique charm and purpose.

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
01  WS-EOF            PIC X VALUE 'N'.
01  WS-INPUT-LINE     PIC X(100).
01  WS-REGEX-PATTERN  PIC X(50) VALUE '^[A-Za-z0-9]+$'.
01  WS-REGEX-RESULT   PIC X(100).
01  WS-TEMP-VAR       PIC X(100).
01  WS-WEATHER        PIC X(10) VALUE 'Sunny'.
01  WS-COUNTER        PIC 9(4) VALUE 0.

PROCEDURE DIVISION.
MAIN-PARA.
    OPEN INPUT INPUT-FILE
    PERFORM UNTIL WS-EOF = 'Y'
     READ INPUT-FILE INTO WS-INPUT-LINE
         AT END
          MOVE 'Y' TO WS-EOF
         NOT AT END
          PERFORM PROCESS-LINE
     END-READ
    END-PERFORM
    CLOSE INPUT-FILE
    STOP RUN.

PROCESS-LINE.
    MOVE WS-INPUT-LINE TO WS-TEMP-VAR
    PERFORM APPLY-REGEX
    DISPLAY 'Processed Line: ' WS-INPUT-LINE
    ADD 1 TO WS-COUNTER.

APPLY-REGEX.
    * Here we apply the magic of regular expressions
    * to our input line, transforming it into something
    * truly magnificent.
    MOVE FUNCTION REVERSE(WS-TEMP-VAR) TO WS-REGEX-RESULT
    IF FUNCTION NUMVAL-C(WS-REGEX-RESULT) > 0
     DISPLAY 'Regex Match Found: ' WS-REGEX-RESULT
    END-IF.

