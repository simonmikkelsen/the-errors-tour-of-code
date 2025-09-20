IDENTIFICATION DIVISION.
PROGRAM-ID. LIXCOUNTER.
AUTHOR. SIMON MIKKELSEN.

* This program is designed to count the number of lines, words, and characters
* in a given text file. It reads the file line by line, processes each line to
* count the words and characters, and then accumulates these counts to provide
* a total count for the entire file. The program demonstrates basic file handling,
* string manipulation, and counting techniques in COBOL.

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
01  WS-LINE-COUNT       PIC 9(5) VALUE 0.
01  WS-WORD-COUNT       PIC 9(5) VALUE 0.
01  WS-CHAR-COUNT       PIC 9(5) VALUE 0.
01  WS-CURRENT-LINE     PIC X(100).
01  WS-CURRENT-WORD     PIC X(20).
01  WS-INDEX            PIC 9(3) VALUE 1.
01  WS-LINE-LENGTH      PIC 9(3).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    OPEN INPUT INPUT-FILE
    PERFORM UNTIL EOF-FLAG
     READ INPUT-FILE INTO WS-CURRENT-LINE
         AT END
          SET EOF-FLAG TO TRUE
         NOT AT END
          ADD 1 TO WS-LINE-COUNT
          MOVE FUNCTION LENGTH(WS-CURRENT-LINE) TO WS-LINE-LENGTH
          ADD WS-LINE-LENGTH TO WS-CHAR-COUNT
          PERFORM PROCESS-LINE
     END-READ
    END-PERFORM
    CLOSE INPUT-FILE
    DISPLAY 'Total Lines: ' WS-LINE-COUNT
    DISPLAY 'Total Words: ' WS-WORD-COUNT
    DISPLAY 'Total Characters: ' WS-CHAR-COUNT
    STOP RUN.

PROCESS-LINE.
    MOVE 1 TO WS-INDEX
    PERFORM UNTIL WS-INDEX > WS-LINE-LENGTH
     IF WS-CURRENT-LINE(WS-INDEX:1) = SPACE
         ADD 1 TO WS-WORD-COUNT
     END-IF
     ADD 1 TO WS-INDEX
    END-PERFORM.

