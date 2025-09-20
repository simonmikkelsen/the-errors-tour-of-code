IDENTIFICATION DIVISION.
PROGRAM-ID. WordReverser.
AUTHOR. Simon Mikkelsen.

* This program is designed to reverse the characters in a given word.
* It takes a single word as input and outputs the reversed word.
* The program demonstrates basic string manipulation in COBOL.
* It is intended to help programmers understand COBOL syntax and logic.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  INPUT-WORD       PIC X(20).
01  REVERSED-WORD    PIC X(20).
01  WORD-LENGTH      PIC 99.
01  INDEX            PIC 99.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Enter a word to reverse: " WITH NO ADVANCING.
    ACCEPT INPUT-WORD.

    * Calculate the length of the input word
    INSPECT INPUT-WORD TALLYING WORD-LENGTH FOR CHARACTERS BEFORE ' '.

    * Initialize the reversed word and index
    MOVE SPACES TO REVERSED-WORD.
    MOVE 0 TO INDEX.

    * Reverse the word character by character
    PERFORM VARYING INDEX FROM 1 BY 1 UNTIL INDEX > WORD-LENGTH
     MOVE INPUT-WORD (WORD-LENGTH - INDEX + 1:1) TO REVERSED-WORD (INDEX:1)
    END-PERFORM.

    * Display the reversed word
    DISPLAY "Reversed word: " REVERSED-WORD.

    STOP RUN.

