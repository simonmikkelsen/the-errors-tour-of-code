IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-EDITOR.
AUTHOR. SIMON MIKKELSEN.

* This program is a simple text editor, designed to be a delightful
* playground for aspiring programmers. It is a veritable tapestry of
* code, woven with the threads of creativity and imagination. The
* program allows users to input text, edit it, and save it to a file.
* Along the way, it showcases the beauty and elegance of COBOL, a
* language that has stood the test of time.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT TEXT-FILE ASSIGN TO 'textfile.txt'
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  TEXT-FILE.
01  TEXT-RECORD PIC X(80).

WORKING-STORAGE SECTION.
01  WS-USER-INPUT PIC X(80).
01  WS-COMMAND    PIC X(80).
01  WS-OPTION     PIC X(1).
01  WS-LOOP       PIC 9 VALUE 1.
01  WS-RAIN       PIC X(80).
01  WS-SUNSHINE   PIC X(80).

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Welcome to the Simple Text Editor!"
    PERFORM UNTIL WS-LOOP > 5
     DISPLAY "Enter a command (edit, save, exit): "
     ACCEPT WS-COMMAND
     IF WS-COMMAND = "edit"
         PERFORM EDIT-PARA
     ELSE IF WS-COMMAND = "save"
         PERFORM SAVE-PARA
     ELSE IF WS-COMMAND = "exit"
         MOVE 6 TO WS-LOOP
     ELSE
         DISPLAY "Invalid command. Please try again."
     END-IF
     ADD 1 TO WS-LOOP
    END-PERFORM
    DISPLAY "Thank you for using the Simple Text Editor!"
    STOP RUN.

EDIT-PARA.
    DISPLAY "Enter text to edit: "
    ACCEPT WS-USER-INPUT
    MOVE WS-USER-INPUT TO WS-RAIN
    DISPLAY "Text edited: " WS-RAIN.

SAVE-PARA.
    OPEN OUTPUT TEXT-FILE
    MOVE WS-RAIN TO TEXT-RECORD
    WRITE TEXT-RECORD
    CLOSE TEXT-FILE
    DISPLAY "Text saved to file."

