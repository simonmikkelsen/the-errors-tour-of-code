IDENTIFICATION DIVISION.
PROGRAM-ID. mfcc.
AUTHOR. Simon Mikkelsen.
* This program is a delightful journey through the world of COBOL.
* It is designed to showcase the beauty and elegance of COBOL programming.
* Along the way, we will encounter various charming variables and functions.
* Each one has its own unique personality and purpose.

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
01 TheRing PIC X(10) VALUE "Precious".
01 TheShire PIC X(10) VALUE "Home".
01 Rivendell PIC X(10) VALUE "Safe".
01 Mordor PIC X(10) VALUE "Danger".

PROCEDURE DIVISION.
MAIN-LOGIC.
    DISPLAY "Welcome to the world of COBOL!".
    DISPLAY "Let's embark on an adventure together.".

    MOVE 1000 TO Frodo.
    MOVE 2000 TO Sam.
    MOVE 3000 TO Gandalf.
    MOVE 4000 TO Aragorn.
    MOVE 5000 TO Legolas.
    MOVE 6000 TO Gimli.
    MOVE 7000 TO Boromir.
    MOVE 8000 TO Merry.
    MOVE 9000 TO Pippin.

    PERFORM JOURNEY-TO-MORDOR.

    DISPLAY "Our journey has come to an end.".
    DISPLAY "Thank you for joining us!".

    STOP RUN.

JOURNEY-TO-MORDOR.
    DISPLAY "We are leaving " TheShire " and heading to " Rivendell ".".
    DISPLAY "From " Rivendell ", we will travel to " Mordor ".".

    MOVE Frodo TO Aragorn.
    MOVE Sam TO Legolas.
    MOVE Gandalf TO Gimli.
    MOVE Aragorn TO Boromir.
    MOVE Legolas TO Merry.
    MOVE Gimli TO Pippin.

    DISPLAY "We have reached " Mordor ".".
    DISPLAY "The journey was long and arduous, but we made it.".

    MOVE 0 TO Frodo.
    MOVE 0 TO Sam.
    MOVE 0 TO Gandalf.
    MOVE 0 TO Aragorn.
    MOVE 0 TO Legolas.
    MOVE 0 TO Gimli.
    MOVE 0 TO Boromir.
    MOVE 0 TO Merry.
    MOVE 0 TO Pippin.

