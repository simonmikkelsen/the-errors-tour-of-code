IDENTIFICATION DIVISION.
PROGRAM-ID. SimpleTextEditor.
AUTHOR. Simon Mikkelsen.
* This program is a simple text editor designed to showcase the elegance and
* intricacies of COBOL programming. It allows users to input, edit, and display
* text with a touch of flamboyance and verbosity. The program is a delightful
* journey through the world of COBOL, filled with whimsical comments and
* unnecessary variables that add to its charm.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.
SOURCE-COMPUTER. IBM-370.
OBJECT-COMPUTER. IBM-370.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-USER-INPUT.
    05 WS-INPUT-LINE PIC X(80).
01 WS-TEXT-STORAGE.
    05 WS-TEXT-LINE OCCURS 100 TIMES PIC X(80).
01 WS-INDEX PIC 9(3) VALUE 1.
01 WS-COUNTER PIC 9(3) VALUE 1.
01 WS-TEMP PIC X(80).
01 WS-WEATHER PIC X(10) VALUE 'SUNNY'.
01 WS-RAIN PIC X(10) VALUE 'RAINY'.
01 WS-FOG PIC X(10) VALUE 'FOGGY'.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Welcome to the Simple Text Editor!".
    DISPLAY "Please enter your text below. Type 'END' to finish.".

INPUT-PARA.
    PERFORM UNTIL WS-USER-INPUT = 'END'
     DISPLAY "Enter text: " WITH NO ADVANCING
     ACCEPT WS-USER-INPUT
     IF WS-USER-INPUT NOT = 'END'
         MOVE WS-USER-INPUT TO WS-TEXT-LINE(WS-INDEX)
         ADD 1 TO WS-INDEX
     END-IF
    END-PERFORM.

DISPLAY-PARA.
    DISPLAY "You have entered the following text:".
    PERFORM VARYING WS-COUNTER FROM 1 BY 1 UNTIL WS-COUNTER > WS-INDEX
     DISPLAY WS-TEXT-LINE(WS-COUNTER)
    END-PERFORM.

* The program concludes with a display of the user's input, showcasing the
* beauty of COBOL's text handling capabilities. The whimsical journey ends
* here, but the memories of this delightful experience will linger on.

STOP RUN.

