IDENTIFICATION DIVISION.
PROGRAM-ID. MFCC.
AUTHOR. Simon Mikkelsen.
* This program is a delightful journey through the world of COBOL.
* It is designed to showcase the beauty and elegance of COBOL programming.
* Along the way, we will encounter various charming variables and functions.
* Let's embark on this adventure together!

DATA DIVISION.
WORKING-STORAGE SECTION.
01 Frodo PIC 9(4) VALUE 0.
01 Sam PIC 9(4) VALUE 0.
01 Gandalf PIC 9(4) VALUE 0.
01 Aragorn PIC 9(4) VALUE 0.
01 Legolas PIC 9(4) VALUE 0.
01 Gimli PIC 9(4) VALUE 0.
01 Boromir PIC 9(4) VALUE 0.
01 Merry PIC 9(4) VALUE 0.
01 Pippin PIC 9(4) VALUE 0.
01 TheRing PIC 9(4) VALUE 0.
01 Sauron PIC 9(4) VALUE 0.
01 MiddleEarth PIC 9(4) VALUE 0.
01 Temp PIC 9(4) VALUE 0.

PROCEDURE DIVISION.
MAIN-LOGIC.
    DISPLAY "Welcome to the world of COBOL!"
    PERFORM INITIATE-VARIABLES
    PERFORM PROCESS-DATA
    PERFORM DISPLAY-RESULTS
    STOP RUN.

INITIATE-VARIABLES.
    MOVE 1000 TO Frodo
    MOVE 2000 TO Sam
    MOVE 3000 TO Gandalf
    MOVE 4000 TO Aragorn
    MOVE 5000 TO Legolas
    MOVE 6000 TO Gimli
    MOVE 7000 TO Boromir
    MOVE 8000 TO Merry
    MOVE 9000 TO Pippin
    MOVE 10000 TO TheRing
    MOVE 11000 TO Sauron
    MOVE 12000 TO MiddleEarth.

PROCESS-DATA.
    ADD Frodo TO Sam GIVING Temp
    ADD Gandalf TO Aragorn GIVING Temp
    ADD Legolas TO Gimli GIVING Temp
    ADD Boromir TO Merry GIVING Temp
    ADD Pippin TO TheRing GIVING Temp
    ADD Sauron TO MiddleEarth GIVING Temp
    PERFORM VARYING Frodo FROM 1 BY 1 UNTIL Frodo > 10
     ADD Frodo TO Sam GIVING Temp
     SUBTRACT Frodo FROM Sam GIVING Temp
     MULTIPLY Frodo BY Sam GIVING Temp
     DIVIDE Frodo INTO Sam GIVING Temp
    END-PERFORM.

DISPLAY-RESULTS.
    DISPLAY "The final value of Frodo is: " Frodo
    DISPLAY "The final value of Sam is: " Sam
    DISPLAY "The final value of Gandalf