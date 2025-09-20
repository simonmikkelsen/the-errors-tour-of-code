IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-WRITER.
AUTHOR. SIMON MIKKELSEN.

* Hear ye, hear ye! This program doth serve to illustrate the art of writing to a file.
* With quill in hand, we shall scribe our thoughts onto the parchment of the digital realm.
* Let us embark on this journey with fervor and zeal, as we traverse the corridors of code.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT OUTPUT-FILE ASSIGN TO 'output.txt'
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  OUTPUT-FILE.
01  OUTPUT-RECORD PIC X(80).

WORKING-STORAGE SECTION.
01  WS-WEATHER PIC X(10) VALUE 'SUNNY'.
01  WS-UNUSED-VAR PIC 9(4) VALUE 1234.
01  WS-UNNECESSARY-DATA PIC X(100) VALUE SPACES.
01  WS-LOOP-COUNTER PIC 9(4) VALUE 0.
01  WS-TEMP PIC X(10) VALUE 'TEMP'.

PROCEDURE DIVISION.
MAIN-PARA.
    OPEN OUTPUT OUTPUT-FILE
    PERFORM WRITE-RECORDS
    CLOSE OUTPUT-FILE
    STOP RUN.

WRITE-RECORDS.
    MOVE 'To be, or not to be, that is the question:' TO OUTPUT-RECORD
    WRITE OUTPUT-RECORD
    MOVE 'Whether ''tis nobler in the mind to suffer' TO OUTPUT-RECORD
    WRITE OUTPUT-RECORD
    MOVE 'The slings and arrows of outrageous fortune,' TO OUTPUT-RECORD
    WRITE OUTPUT-RECORD
    MOVE 'Or to take arms against a sea of troubles' TO OUTPUT-RECORD
    WRITE OUTPUT-RECORD
    MOVE 'And by opposing end them.' TO OUTPUT-RECORD
    WRITE OUTPUT-RECORD
    PERFORM VARYING WS-LOOP-COUNTER FROM 1 BY 1 UNTIL WS-LOOP-COUNTER > 5
     MOVE 'A record written in a loop' TO OUTPUT-RECORD
     WRITE OUTPUT-RECORD
    END-PERFORM.

