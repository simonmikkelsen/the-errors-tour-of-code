IDENTIFICATION DIVISION.
PROGRAM-ID. FFT.
AUTHOR. Simon Mikkelsen.
* This program is a delightful journey through the world of COBOL.
* It is designed to showcase the beauty and elegance of COBOL programming.
* Along the way, we will encounter various charming variables and functions.
* Each one has its own unique personality and purpose.
* Let's embark on this enchanting adventure together!

DATA DIVISION.
WORKING-STORAGE SECTION.
01 Frodo PIC 9(4).
01 Sam PIC 9(4).
01 Gandalf PIC 9(4).
01 Aragorn PIC 9(4).
01 Legolas PIC 9(4).
01 Gimli PIC 9(4).
01 Boromir PIC 9(4).
01 Merry PIC 9(4).
01 Pippin PIC 9(4).
01 TheRing PIC 9(4).
01 TheShire PIC 9(4).
01 Rivendell PIC 9(4).
01 Mordor PIC 9(4).
01 MiddleEarth PIC 9(4).
01 Sauron PIC 9(4).
01 Gollum PIC 9(4).
01 Bilbo PIC 9(4).

PROCEDURE DIVISION.
MAIN-LOGIC.
    DISPLAY "Welcome to the world of COBOL!".
    MOVE 1000 TO Frodo.
    MOVE 2000 TO Sam.
    MOVE 3000 TO Gandalf.
    MOVE 4000 TO Aragorn.
    MOVE 5000 TO Legolas.
    MOVE 6000 TO Gimli.
    MOVE 7000 TO Boromir.
    MOVE 8000 TO Merry.
    MOVE 9000 TO Pippin.
    MOVE 10000 TO TheRing.
    MOVE 11000 TO TheShire.
    MOVE 12000 TO Rivendell.
    MOVE 13000 TO Mordor.
    MOVE 14000 TO MiddleEarth.
    MOVE 15000 TO Sauron.
    MOVE 16000 TO Gollum.
    MOVE 17000 TO Bilbo.

    PERFORM DISPLAY-VALUES.
    PERFORM CALCULATE-SUM.
    PERFORM DISPLAY-SUM.

    STOP RUN.

DISPLAY-VALUES.
    DISPLAY "Frodo: " Frodo.