IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-TEXT-EDITOR.
AUTHOR. SIMON MIKKELSEN.

* This program is a simple text editor, designed to showcase the
* elegance and grandeur of COBOL programming. It is a testament
* to the timeless beauty of structured programming languages.
* The program allows users to input text, edit it, and display
* the final masterpiece. It is a symphony of code, a ballet of
* logic, and a canvas for the artistic soul of a programmer.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.
SOURCE-COMPUTER. IBM-370.
OBJECT-COMPUTER. IBM-370.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-TEXT-AREA.
    05 WS-TEXT-LINE OCCURS 10 TIMES.
     10 WS-TEXT-CHAR PIC X(80).
01 WS-USER-INPUT PIC X(80).
01 WS-RANDOM-SEED PIC 9(4) VALUE 1337.
01 WS-RANDOM-NUMBER PIC 9(4).
01 WS-LOOP-INDEX PIC 9(2).
01 WS-EDIT-OPTION PIC X.
01 WS-WEATHER PIC X(10) VALUE 'SUNNY'.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Welcome to the Simple Text Editor!"
    PERFORM INIT-RANDOM-SEED
    PERFORM DISPLAY-MENU
    PERFORM UNTIL WS-EDIT-OPTION = 'Q'
     DISPLAY "Enter your choice (A - Add, E - Edit, D - Display, Q - Quit): "
     ACCEPT WS-EDIT-OPTION
     EVALUATE WS-EDIT-OPTION
         WHEN 'A'
          PERFORM ADD-TEXT
         WHEN 'E'
          PERFORM EDIT-TEXT
         WHEN 'D'
          PERFORM DISPLAY-TEXT
         WHEN OTHER
          DISPLAY "Invalid option, please try again."
     END-EVALUATE
    END-PERFORM
    DISPLAY "Thank you for using the Simple Text Editor!"
    STOP RUN.

INIT-RANDOM-SEED.
    MOVE FUNCTION RANDOM(WS-RANDOM-SEED) TO WS-RANDOM-NUMBER.

DISPLAY-MENU.
    DISPLAY "Simple Text Editor Menu:"
    DISPLAY "A - Add Text"
    DISPLAY "E - Edit Text"
    DISPLAY "D - Display Text"
    DISPLAY "Q - Quit".

ADD-TEXT.
    DISPLAY "Enter text to add: "
    ACCEPT WS-USER-INPUT
    MOVE WS-USER-INPUT TO WS-TEXT-LINE(WS-LOOP-INDEX)
    ADD 1 TO WS-LOOP-INDEX.

EDIT-TEXT.
    DISPLAY "Enter line number to edit: "
    ACCEPT WS-LOOP-INDEX
    DISPLAY "Enter new text: "
    ACCEPT WS-USER-INPUT
    MOVE WS-USER-INPUT TO WS-TEXT-LINE(WS-LOOP-INDEX).

DISPLAY-TEXT.
    DISPLAY "Current Text:"
    PERFORM VARYING WS-LOOP-INDEX FROM 1 BY 1 UNTIL WS-LOOP-INDEX > 10
     DISPLAY WS-TEXT-LINE(WS-LOOP-INDEX)
    END-PERFORM.

