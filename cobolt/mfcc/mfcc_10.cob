IDENTIFICATION DIVISION.
PROGRAM-ID. mfcc.
AUTHOR. Simon Mikkelsen.
* This program is a delightful journey through the world of COBOL.
* It is designed to bring joy and learning to all who read it.
* We will explore various aspects of COBOL programming in a fun and engaging way.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT INPUT-FILE ASSIGN TO 'input.txt'
     ORGANIZATION IS LINE SEQUENTIAL.
    SELECT OUTPUT-FILE ASSIGN TO 'output.txt'
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  INPUT-FILE.
01  INPUT-RECORD PIC X(100).

FD  OUTPUT-FILE.
01  OUTPUT-RECORD PIC X(100).

WORKING-STORAGE SECTION.
01  WS-USER-INPUT PIC X(100).
01  WS-TEMP-VARIABLE PIC X(100).
01  WS-LOTR-VARIABLE PIC X(100).
01  WS-RESULT PIC X(100).
01  WS-COUNTER PIC 9(4) VALUE 0.

PROCEDURE DIVISION.
MAIN-PARA.
    OPEN INPUT INPUT-FILE.
    OPEN OUTPUT OUTPUT-FILE.
    PERFORM READ-INPUT-FILE
    PERFORM PROCESS-USER-INPUT
    PERFORM WRITE-OUTPUT-FILE
    CLOSE INPUT-FILE
    CLOSE OUTPUT-FILE
    STOP RUN.

READ-INPUT-FILE.
    READ INPUT-FILE INTO WS-TEMP-VARIABLE
     AT END MOVE 'EOF' TO WS-TEMP-VARIABLE
    END-READ.

PROCESS-USER-INPUT.
    DISPLAY 'Please enter some text:'
    ACCEPT WS-USER-INPUT
    MOVE WS-USER-INPUT TO WS-LOTR-VARIABLE
    PERFORM VARYING WS-COUNTER FROM 1 BY 1 UNTIL WS-COUNTER > 10
     ADD 1 TO WS-COUNTER
    END-PERFORM
    MOVE WS-LOTR-VARIABLE TO WS-RESULT.

WRITE-OUTPUT-FILE.
    MOVE WS-RESULT TO OUTPUT-RECORD
    WRITE OUTPUT-RECORD.
