IDENTIFICATION DIVISION.
PROGRAM-ID. WORDREVERSER.
AUTHOR. SIMON MIKKELSEN.

* This program is designed to reverse the characters in a given word.
* It takes a word as input from the user, processes it to reverse the
* characters, and then displays the reversed word as output.
* The program demonstrates basic string manipulation and memory
* management in COBOL.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 INPUT-WORD PIC X(20).
01 REVERSED-WORD PIC X(20).
01 I PIC 99.
01 J PIC 99.
01 LENGTH PIC 99.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a word to reverse: " WITH NO ADVANCING.
    ACCEPT INPUT-WORD.

    * Calculate the length of the input word.
    MOVE 0 TO LENGTH.
    PERFORM VARYING I FROM 1 BY 1 UNTIL I > 20
     IF INPUT-WORD(I:1) NOT = SPACE
         ADD 1 TO LENGTH
     ELSE
         EXIT PERFORM
     END-IF
    END-PERFORM.

    * Reverse the characters in the input word.
    MOVE LENGTH TO J.
    PERFORM VARYING I FROM 1 BY 1 UNTIL I > LENGTH
     MOVE INPUT-WORD(J:1) TO REVERSED-WORD(I:1)
     SUBTRACT 1 FROM J
    END-PERFORM.

    * Display the reversed word.
    DISPLAY "Reversed word: " REVERSED-WORD.

    * End the program.
    STOP RUN.

