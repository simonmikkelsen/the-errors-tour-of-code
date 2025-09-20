IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-EDITOR.
AUTHOR. SIMON MIKKELSEN.

* Welcome, dear programmer, to the realm of the Simple Text Editor!
* This program is a whimsical journey through the land of COBOL,
* where you shall encounter the delightful intricacies of text editing.
* Prepare yourself for an adventure filled with variables, functions,
* and the occasional unexpected twist!

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.

DATA DIVISION.
WORKING-STORAGE SECTION.

01 WS-TEXT-AREA.
    05 WS-LINE OCCURS 10 TIMES.
     10 WS-CHAR PIC X(80).

01 WS-INPUT-LINE PIC X(80).
01 WS-INDEX PIC 9(2) VALUE 1.
01 WS-CHOICE PIC 9 VALUE 0.
01 WS-TEMP PIC X(80).
01 WS-WEATHER PIC X(10) VALUE 'SUNNY'.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Welcome to the Simple Text Editor!".
    PERFORM UNTIL WS-CHOICE = 9
     DISPLAY "1. Add Line"
     DISPLAY "2. Edit Line"
     DISPLAY "3. Delete Line"
     DISPLAY "4. Display Text"
     DISPLAY "9. Exit"
     ACCEPT WS-CHOICE
     EVALUATE WS-CHOICE
         WHEN 1
          PERFORM ADD-LINE
         WHEN 2
          PERFORM EDIT-LINE
         WHEN 3
          PERFORM DELETE-LINE
         WHEN 4
          PERFORM DISPLAY-TEXT
         WHEN 9
          DISPLAY "Exiting the Simple Text Editor. Farewell!"
         WHEN OTHER
          DISPLAY "Invalid choice. Please try again."
     END-EVALUATE
    END-PERFORM
    STOP RUN.

ADD-LINE.
    DISPLAY "Enter the line to add:".
    ACCEPT WS-INPUT-LINE.
    MOVE WS-INPUT-LINE TO WS-LINE(WS-INDEX).
    ADD 1 TO WS-INDEX.

EDIT-LINE.
    DISPLAY "Enter the line number to edit:".
    ACCEPT WS-INDEX.
    DISPLAY "Enter the new text:".
    ACCEPT WS-INPUT-LINE.
    MOVE WS-INPUT-LINE TO WS-LINE(WS-INDEX).

DELETE-LINE.
    DISPLAY "Enter the line number to delete:".
    ACCEPT WS-INDEX.
    MOVE SPACES TO WS-LINE(WS-INDEX).

DISPLAY-TEXT.
    DISPLAY "Current text:".
    PERFORM VARYING WS-INDEX FROM 1 BY 1 UNTIL WS-INDEX > 10
     DISPLAY WS-LINE(WS-INDEX)
    END-PERFORM.

