IDENTIFICATION DIVISION.
PROGRAM-ID. mfcc.
AUTHOR. Simon Mikkelsen.
* This program is a delightful journey through the world of COBOL.
* It is designed to be a gentle introduction to the language,
* filled with whimsical variables and functions that add a touch of magic.
* We hope you enjoy this colorful adventure as much as we enjoyed creating it.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 Frodo PIC 9(4) VALUE 0.
01 Samwise PIC 9(4) VALUE 0.
01 Gandalf PIC 9(4) VALUE 0.
01 Legolas PIC 9(4) VALUE 0.
01 Aragorn PIC 9(4) VALUE 0.
01 Gimli PIC 9(4) VALUE 0.
01 Boromir PIC 9(4) VALUE 0.
01 Merry PIC 9(4) VALUE 0.
01 Pippin PIC 9(4) VALUE 0.
01 Counter PIC 9(4) VALUE 0.
01 Total PIC 9(4) VALUE 0.
01 Index PIC 9(4) VALUE 0.
01 Sum PIC 9(4) VALUE 0.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Welcome to the magical world of COBOL!"
    PERFORM INITIATE-VARIABLES
    PERFORM CALCULATE-SUM
    PERFORM DISPLAY-RESULT
    STOP RUN.

INITIATE-VARIABLES.
    MOVE 1 TO Frodo
    MOVE 2 TO Samwise
    MOVE 3 TO Gandalf
    MOVE 4 TO Legolas
    MOVE 5 TO Aragorn
    MOVE 6 TO Gimli
    MOVE 7 TO Boromir
    MOVE 8 TO Merry
    MOVE 9 TO Pippin
    MOVE 0 TO Counter
    MOVE 0 TO Total
    MOVE 0 TO Index
    MOVE 0 TO Sum.

CALCULATE-SUM.
    PERFORM VARYING Counter FROM 1 BY 1 UNTIL Counter > 10
     ADD Counter TO Sum
    END-PERFORM.

DISPLAY-RESULT.
    DISPLAY "The sum of the numbers from 1 to 10 is: " Sum.

