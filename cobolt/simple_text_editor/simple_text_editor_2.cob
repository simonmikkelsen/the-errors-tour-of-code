IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-TEXT-EDITOR.
AUTHOR. SIMON MIKKELSEN.
* This program is a whimsical journey into the realm of text editing,
* designed to enchant and educate aspiring programmers with its
* flamboyant verbosity and colorful commentary. Prepare to be dazzled
* by the myriad of variables and functions, some of which may seem
* superfluous, but all contribute to the grand tapestry of this
* educational masterpiece.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.
SOURCE-COMPUTER. IBM-370.
OBJECT-COMPUTER. IBM-370.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-EDITOR-BUFFER.
    05 WS-TEXT-LINE OCCURS 100 TIMES.
     10 WS-CHARACTER PIC X(80).
01 WS-USER-INPUT PIC X(80).
01 WS-OPTION PIC 9.
01 WS-LOOP-COUNTER PIC 9(4) VALUE 1.
01 WS-TEMP-VARIABLE PIC X(80).
01 WS-WEATHER PIC X(10) VALUE 'SUNNY'.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Welcome to the Simple Text Editor!".
    DISPLAY "The weather today is " WS-WEATHER.
    PERFORM UNTIL WS-OPTION = 9
     DISPLAY "1. Add Text Line"
     DISPLAY "2. Display Text"
     DISPLAY "9. Exit"
     ACCEPT WS-OPTION
     EVALUATE WS-OPTION
         WHEN 1
          PERFORM ADD-TEXT-LINE
         WHEN 2
          PERFORM DISPLAY-TEXT
         WHEN 9
          DISPLAY "Exiting the Simple Text Editor. Have a splendid day!"
         WHEN OTHER
          DISPLAY "Invalid option. Please try again."
     END-EVALUATE
    END-PERFORM.
    STOP RUN.

ADD-TEXT-LINE.
    DISPLAY "Enter text line to add:"
    ACCEPT WS-USER-INPUT
    MOVE WS-USER-INPUT TO WS-TEXT-LINE(WS-LOOP-COUNTER)
    ADD 1 TO WS-LOOP-COUNTER.

DISPLAY-TEXT.
    DISPLAY "Current text in the editor:"
    PERFORM VARYING WS-LOOP-COUNTER FROM 1 BY 1 UNTIL WS-LOOP-COUNTER > 100
     IF WS-TEXT-LINE(WS-LOOP-COUNTER) NOT = SPACES
         DISPLAY WS-TEXT-LINE(WS-LOOP-COUNTER)
     END-IF
    END-PERFORM.

