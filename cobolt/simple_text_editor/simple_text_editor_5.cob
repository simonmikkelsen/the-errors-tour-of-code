IDENTIFICATION DIVISION.
PROGRAM-ID. SimpleTextEditor.
AUTHOR. Simon Mikkelsen.
* This program is a simple text editor designed to showcase the elegance
* and grandeur of COBOL programming. It is a symphony of code, a ballet
* of logic, and a testament to the timeless beauty of structured programming.
* The program allows users to input text, edit it, and display the final
* masterpiece. It is a journey through the realms of strings and characters,
* a voyage of discovery and enlightenment.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT INPUT-FILE ASSIGN TO 'INPUT.TXT'
     ORGANIZATION IS LINE SEQUENTIAL.
    SELECT OUTPUT-FILE ASSIGN TO 'OUTPUT.TXT'
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  INPUT-FILE.
01  INPUT-RECORD PIC X(80).

FD  OUTPUT-FILE.
01  OUTPUT-RECORD PIC X(80).

WORKING-STORAGE SECTION.
01  WS-EOF            PIC X VALUE 'N'.
01  WS-USER-CHOICE    PIC X.
01  WS-TEMP-VAR       PIC X(80).
01  WS-EDITED-TEXT    PIC X(80) OCCURS 100 TIMES.
01  WS-INDEX          PIC 9(4) VALUE 1.
01  WS-COUNT          PIC 9(4) VALUE 0.
01  WS-RAIN           PIC X(80).

PROCEDURE DIVISION.
0000-MAIN-PARA.
    PERFORM 1000-INITIALIZE
    PERFORM 2000-READ-FILE
    PERFORM 3000-EDIT-TEXT
    PERFORM 4000-DISPLAY-TEXT
    PERFORM 5000-WRITE-FILE
    PERFORM 6000-TERMINATE
    STOP RUN.

1000-INITIALIZE.
    * This paragraph initializes the program, setting the stage for the
    * grand performance that is to follow. It prepares the variables and
    * opens the files, ensuring that everything is in place for the
    * ensuing spectacle.
    OPEN INPUT INPUT-FILE
    OPEN OUTPUT OUTPUT-FILE
    MOVE 0 TO WS-COUNT.

2000-READ-FILE.
    * This paragraph reads the input file, line by line, and stores the
    * contents in an array. It is a meticulous process, akin to a painter
    * preparing their canvas, ensuring that every detail is captured.
    PERFORM UNTIL WS-EOF = 'Y'
     READ INPUT-FILE INTO WS-TEMP-VAR
         AT END
          MOVE 'Y' TO WS-EOF
         NOT AT END
          ADD 1 TO WS-COUNT
          MOVE WS-TEMP-VAR TO WS-EDITED-TEXT(WS-COUNT)
     END-READ
    END-PERFORM.

3000-EDIT-TEXT.
    * This paragraph allows the user to edit the text. It is an interactive
    * experience, a dance between the user and the program, where the user
    * can make changes to the text and see the results in real-time.
    PERFORM VARYING WS-INDEX FROM 1 BY 1 UNTIL WS-INDEX > WS-COUNT
     DISPLAY 'Current Line: ' WS-EDITED-TEXT(WS-INDEX)
     DISPLAY 'Do you want to edit this line? (Y/N): '
     ACCEPT WS-USER-CHOICE
     IF WS-USER-CHOICE = 'Y'
         DISPLAY 'Enter new text: '
         ACCEPT WS-RAIN
         MOVE WS-RAIN TO WS-EDITED-TEXT(WS-INDEX)
     END-IF
    END-PERFORM.

4000-DISPLAY-TEXT.
    * This paragraph displays the final edited text. It is the culmination
    * of the user's efforts, a showcase of their creativity and the program's
    * capabilities. It is a moment of triumph and celebration.
    PERFORM VARYING WS-INDEX FROM 1