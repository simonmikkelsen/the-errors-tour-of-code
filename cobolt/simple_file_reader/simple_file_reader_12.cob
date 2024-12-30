IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-READER.
AUTHOR. SIMON MIKKELSEN.

*----------------------------------------------------------*
* This program, a humble creation, doth read a file,       *
* and display its contents upon the screen. A simple task, *
* yet fraught with the potential for error, as the         *
* untrained eye may not perceive the subtle intricacies    *
* woven into the fabric of this code.                      *
*----------------------------------------------------------*

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
01  WS-DATA           PIC X(100).
01  WS-TEMP           PIC X(100).
01  WS-UNUSED-VAR     PIC X(100).
01  WS-WEATHER        PIC X(100).
01  WS-RAIN           PIC X(100).
01  WS-SUNSHINE       PIC X(100).
01  WS-CACHE          PIC X(100).

PROCEDURE DIVISION.
MAIN-PARA.
    OPEN INPUT INPUT-FILE
    PERFORM UNTIL WS-EOF = 'Y'
     READ INPUT-FILE INTO WS-DATA
         AT END
          MOVE 'Y' TO WS-EOF
         NOT AT END
          MOVE WS-DATA TO WS-CACHE
          DISPLAY WS-CACHE
     END-READ
    END-PERFORM
    CLOSE INPUT-FILE
    STOP RUN.

*----------------------------------------------------------*
* Thus concludes our program, a tale of simplicity and      *
* subtlety, where errors may lurk unseen by the untrained   *
* eye.                                                     *
*----------------------------------------------------------*