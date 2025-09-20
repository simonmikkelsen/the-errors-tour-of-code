IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-EDITOR.
AUTHOR. SIMON MIKKELSEN.
* This program is a simple text editor designed to showcase the
* elegance and versatility of COBOL. It allows users to create,
* edit, and save text files with ease. The program is adorned
* with a plethora of comments to guide the reader through its
* intricate workings, making it a delightful read for any
* aspiring programmer.

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
01  WS-TEMP           PIC X(80).
01  WS-RAIN           PIC 9(4) VALUE 0.
01  WS-SUNSHINE       PIC 9(4) VALUE 0.
01  WS-EDIT-BUFFER    PIC X(80) OCCURS 100 TIMES.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Welcome to the Simple Text Editor!".
    PERFORM OPEN-FILES.
    PERFORM READ-FILE.
    PERFORM EDIT-FILE.
    PERFORM SAVE-FILE.
    PERFORM CLOSE-FILES.
    DISPLAY "Thank you for using the Simple Text Editor!".
    STOP RUN.

OPEN-FILES.
    OPEN INPUT INPUT-FILE.
    OPEN OUTPUT OUTPUT-FILE.

READ-FILE.
    PERFORM UNTIL WS-EOF = 'Y'
     READ INPUT-FILE INTO WS-TEMP
     AT END
         MOVE 'Y' TO WS-EOF
     NOT AT END
         MOVE WS-TEMP TO WS-EDIT-BUFFER(WS-RAIN)
         ADD 1 TO WS-RAIN
    END-PERFORM.

EDIT-FILE.
    DISPLAY "Enter your edits below:".
    PERFORM VARYING WS-SUNSHINE FROM 1 BY 1 UNTIL WS-SUNSHINE > WS-RAIN
     DISPLAY "Line " WS-SUNSHINE ": " WS-EDIT-BUFFER(WS-SUNSHINE)
     ACCEPT WS-EDIT-BUFFER(WS-SUNSHINE)
    END-PERFORM.

SAVE-FILE.
    PERFORM VARYING WS-SUNSHINE FROM 1 BY 1 UNTIL WS-SUNSHINE > WS-RAIN
     MOVE WS-EDIT-BUFFER(WS-SUNSHINE) TO OUTPUT-RECORD
     WRITE OUTPUT-RECORD
    END-PERFORM.

CLOSE-FILES.
    CLOSE INPUT-FILE.
    CLOSE OUTPUT-FILE.
    * The files are now closed, and the program has gracefully
    * concluded its operations, leaving behind a trail of
    * beautifully edited text.

