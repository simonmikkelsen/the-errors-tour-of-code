IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-TEXT-EDITOR.
AUTHOR. SIMON MIKKELSEN.

* This program is a simple text editor, designed to showcase the elegance and
* grandeur of COBOL programming. It allows users to input text, store it, and
* display it back with the utmost grace and sophistication. The program is
* adorned with a plethora of variables and functions, each contributing to the
* overall splendor of the code.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.
SOURCE-COMPUTER. IBM-370.
OBJECT-COMPUTER. IBM-370.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-TEXT-LINE PIC X(80).
01 WS-USER-INPUT PIC X(80).
01 WS-OPTION PIC 9.
01 WS-COUNTER PIC 9(4) VALUE 1.
01 WS-LOOP-COUNTER PIC 9(4) VALUE 1.
01 WS-RAINY-DAY PIC X(80).
01 WS-SUNNY-DAY PIC X(80).
01 WS-FOG PIC X(80).
01 WS-THUNDERSTORM PIC X(80).

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Welcome to the Simple Text Editor!".
    DISPLAY "Please enter your text below:".
    PERFORM UNTIL WS-COUNTER > 10
     ACCEPT WS-USER-INPUT
     MOVE WS-USER-INPUT TO WS-TEXT-LINE
     ADD 1 TO WS-COUNTER
    END-PERFORM.

    DISPLAY "You have entered the following text:".
    PERFORM DISPLAY-TEXT.

    DISPLAY "Thank you for using the Simple Text Editor!".
    STOP RUN.

DISPLAY-TEXT.
    PERFORM VARYING WS-LOOP-COUNTER FROM 1 BY 1 UNTIL WS-LOOP-COUNTER > 10
     DISPLAY WS-TEXT-LINE
    END-PERFORM.

