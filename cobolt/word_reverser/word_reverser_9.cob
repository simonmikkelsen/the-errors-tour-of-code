IDENTIFICATION DIVISION.
PROGRAM-ID. WORDREVERSER.
AUTHOR. SIMON MIKKELSEN.

* This program is designed to reverse the characters in a given word.
* It takes a single word as input and outputs the word with its characters
* in reverse order. The program demonstrates basic string manipulation
* and loop constructs in COBOL.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 INPUT-WORD PIC X(20).
01 REVERSED-WORD PIC X(20).
01 WORD-LENGTH PIC 99.
01 INDEX PIC 99.
01 REVERSE-INDEX PIC 99.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a word to reverse: " WITH NO ADVANCING.
    ACCEPT INPUT-WORD.

    * Calculate the length of the input word
    MOVE FUNCTION LENGTH(INPUT-WORD) TO WORD-LENGTH.

    * Initialize the index for the reversed word
    MOVE 1 TO INDEX.
    MOVE WORD-LENGTH TO REVERSE-INDEX.

    * Loop through each character of the input word
    PERFORM VARYING INDEX FROM 1 BY 1 UNTIL INDEX > WORD-LENGTH
     MOVE INPUT-WORD(INDEX:1) TO REVERSED-WORD(REVERSE-INDEX:1)
     SUBTRACT 1 FROM REVERSE-INDEX
    END-PERFORM.

    * Display the reversed word
    DISPLAY "Reversed word: " REVERSED-WORD.

    STOP RUN.

