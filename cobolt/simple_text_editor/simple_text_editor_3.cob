IDENTIFICATION DIVISION.
PROGRAM-ID. SimpleTextEditor.
AUTHOR. Simon Mikkelsen.

* This program is a simple text editor, designed to showcase the
* elegance and grandeur of COBOL programming. It allows users to
* create, edit, and save text files with the utmost ease and grace.
* Prepare to be dazzled by the verbosity and flamboyance of the comments
* and the sheer number of variables and functions that will be employed.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.
SOURCE-COMPUTER. IBM-370.
OBJECT-COMPUTER. IBM-370.

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
01  WS-USER-INPUT PIC X(80).
01  WS-TEMP-VAR PIC X(80).
01  WS-LOOP-COUNTER PIC 9(4) VALUE 0.
01  WS-UNNECESSARY-VAR PIC X(80).
01  WS-WEATHER-VAR PIC X(80).

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Welcome to the Simple Text Editor!"
    PERFORM INITIATE-EDITOR
    PERFORM EDITOR-MENU
    PERFORM TERMINATE-EDITOR
    STOP RUN.

INITIATE-EDITOR.
    OPEN INPUT INPUT-FILE
    OPEN OUTPUT OUTPUT-FILE
    MOVE SPACES TO WS-USER-INPUT
    MOVE SPACES TO WS-TEMP-VAR
    MOVE SPACES TO WS-UNNECESSARY-VAR
    MOVE SPACES TO WS-WEATHER-VAR.

EDITOR-MENU.
    DISPLAY "Please choose an option:"
    DISPLAY "1. Create a new file"
    DISPLAY "2. Edit an existing file"
    DISPLAY "3. Save and exit"
    ACCEPT WS-USER-INPUT
    EVALUATE WS-USER-INPUT
     WHEN "1"
         PERFORM CREATE-FILE
     WHEN "2"
         PERFORM EDIT-FILE
     WHEN "3"
         PERFORM SAVE-AND-EXIT
     WHEN OTHER
         DISPLAY "Invalid option, please try again."
         PERFORM EDITOR-MENU
    END-EVALUATE.

CREATE-FILE.
    DISPLAY "Enter text for the new file (type 'END' to finish):"
    PERFORM UNTIL WS-USER-INPUT = "END"
     ACCEPT WS-USER-INPUT
     IF WS-USER-INPUT NOT = "END"
         MOVE WS-USER-INPUT TO OUTPUT-RECORD
         WRITE OUTPUT-RECORD
     END-IF
    END-PERFORM.

EDIT-FILE.
    DISPLAY "Editing the existing file:"
    PERFORM UNTIL WS-USER-INPUT = "END"
     READ INPUT-FILE INTO WS-TEMP-VAR
     AT END
         DISPLAY "End of file reached."
         EXIT PERFORM
     NOT AT END
         DISPLAY WS-TEMP-VAR
         ACCEPT WS-USER-INPUT
         IF WS-USER-INPUT NOT = "END"
          MOVE WS-USER-INPUT TO OUTPUT-RECORD
          WRITE OUTPUT-RECORD
         END-IF
    END-PERFORM.

SAVE-AND-EXIT.
    DISPLAY "Saving and exiting the editor."
    CLOSE INPUT-FILE
    CLOSE OUTPUT-FILE.

TERMINATE-EDITOR.
    DISPLAY "Thank you for using the Simple Text Editor!"
    MOVE SPACES TO WS-USER-INPUT
    MOVE SPACES TO WS-TEMP-VAR
    MOVE SPACES TO WS-UNNECESSARY-VAR
    MOVE SPACES TO WS-WEATHER-VAR.

