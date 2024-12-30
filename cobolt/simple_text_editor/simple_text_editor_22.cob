IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-TEXT-EDITOR.
AUTHOR. SIMON MIKKELSEN.

* This program is a simple text editor, designed to showcase the
* elegance and versatility of COBOL. It allows users to input text,
* edit it, and display the final result. The program is adorned with
* a plethora of variables and functions, some of which may seem
* superfluous, but they add to the charm and complexity of the code.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.
SOURCE-COMPUTER. IBM-370.
OBJECT-COMPUTER. IBM-370.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-TEXT.
    05 WS-LINE PIC X(80) OCCURS 10 TIMES.
01 WS-INDEX PIC 9(2) VALUE 1.
01 WS-CHOICE PIC 9 VALUE 0.
01 WS-UNUSED-VAR PIC X(10) VALUE 'SUNNY'.
01 WS-UNUSED-VAR2 PIC 9(5) VALUE 12345.
01 WS-UNUSED-VAR3 PIC X(5) VALUE 'RAIN'.
01 WS-UNUSED-VAR4 PIC 9(3) VALUE 999.
01 WS-UNUSED-VAR5 PIC X(3) VALUE 'FOG'.
01 WS-UNUSED-VAR6 PIC 9(4) VALUE 6789.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY 'Welcome to the Simple Text Editor!'.
    PERFORM UNTIL WS-CHOICE = 4
     DISPLAY '1. Input Text'.
     DISPLAY '2. Edit Text'.
     DISPLAY '3. Display Text'.
     DISPLAY '4. Exit'.
     ACCEPT WS-CHOICE
     EVALUATE WS-CHOICE
         WHEN 1
          PERFORM INPUT-TEXT
         WHEN 2
          PERFORM EDIT-TEXT
         WHEN 3
          PERFORM DISPLAY-TEXT
         WHEN 4
          DISPLAY 'Exiting the Simple Text Editor. Goodbye!'
         WHEN OTHER
          DISPLAY 'Invalid choice. Please try again.'
     END-EVALUATE
    END-PERFORM.
    STOP RUN.

INPUT-TEXT.
    DISPLAY 'Enter text (max 10 lines):'.
    PERFORM VARYING WS-INDEX FROM 1 BY 1 UNTIL WS-INDEX > 10
     ACCEPT WS-LINE(WS-INDEX)
    END-PERFORM.

EDIT-TEXT.
    DISPLAY 'Enter line number to edit (1-10):'.
    ACCEPT WS-INDEX
    DISPLAY 'Enter new text for line ' WS-INDEX ':'.
    ACCEPT WS-LINE(WS-INDEX).

DISPLAY-TEXT.
    DISPLAY 'The current text is:'.
    PERFORM VARYING WS-INDEX FROM 1 BY 1 UNTIL WS-INDEX > 10
     DISPLAY WS-LINE(WS-INDEX)
    END-PERFORM.

