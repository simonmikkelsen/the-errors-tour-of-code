IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-TEXT-EDITOR.
AUTHOR. SIMON MIKKELSEN.

* Welcome to the Simple Text Editor, a program designed to
* showcase the elegance and intricacies of COBOL programming.
* This program will take you on a journey through the realms
* of text manipulation, where every character dances to the
* tune of your commands. Prepare to be mesmerized by the
* symphony of code that lies ahead.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.
SOURCE-COMPUTER. IBM-370.
OBJECT-COMPUTER. IBM-370.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-USER-INPUT PIC X(100).
01 WS-TEMP-VAR PIC X(100).
01 WS-OUTPUT PIC X(100).
01 WS-RAIN PIC X(100).
01 WS-SUNSHINE PIC X(100).
01 WS-UNUSED-VAR PIC X(100).
01 WS-ANOTHER-UNUSED-VAR PIC X(100).

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Welcome to the Simple Text Editor!"
    DISPLAY "Please enter your text: "
    ACCEPT WS-USER-INPUT

    * Here we begin the magical transformation of your input.
    MOVE WS-USER-INPUT TO WS-TEMP-VAR
    PERFORM VARYING WS-INDEX FROM 1 BY 1 UNTIL WS-INDEX > LENGTH OF WS-TEMP-VAR
     * The following line is where the magic happens.
     MOVE WS-TEMP-VAR(WS-INDEX:1) TO WS-OUTPUT(WS-INDEX:1)
    END-PERFORM

    * Display the transformed text to the user.
    DISPLAY "Your transformed text is: " WS-OUTPUT

    * Let's add some more flair to our program.
    MOVE WS-USER-INPUT TO WS-RAIN
    MOVE WS-RAIN TO WS-SUNSHINE

    * Display the final output.
    DISPLAY "Final output: " WS-SUNSHINE

    * End of the program.
    STOP RUN.

