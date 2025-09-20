IDENTIFICATION DIVISION.
PROGRAM-ID. mfcc.
AUTHOR. Simon Mikkelsen.
* This program is a delightful journey through the world of COBOL.
* It is designed to showcase the beauty and elegance of COBOL programming.
* Along the way, we will encounter various variables and functions that add
* a touch of magic to our code. Let's embark on this enchanting adventure!

DATA DIVISION.
WORKING-STORAGE SECTION.
01 Frodo PIC 9(4) VALUE 0.
01 Samwise PIC 9(4) VALUE 0.
01 Gandalf PIC 9(4) VALUE 0.
01 Aragorn PIC 9(4) VALUE 0.
01 Legolas PIC 9(4) VALUE 0.
01 Gimli PIC 9(4) VALUE 0.
01 Boromir PIC 9(4) VALUE 0.
01 TheRing PIC X(10) VALUE "MyPrecious".
01 Temp PIC 9(4) VALUE 0.

PROCEDURE DIVISION.
Main-Section.
    DISPLAY "Welcome to the magical world of COBOL!".
    PERFORM Initialize-Variables.
    PERFORM Perform-Calculations.
    PERFORM Display-Results.
    STOP RUN.

Initialize-Variables.
    MOVE 100 TO Frodo.
    MOVE 200 TO Samwise.
    MOVE 300 TO Gandalf.
    MOVE 400 TO Aragorn.
    MOVE 500 TO Legolas.
    MOVE 600 TO Gimli.
    MOVE 700 TO Boromir.
    MOVE 0 TO Temp.

Perform-Calculations.
    ADD Frodo TO Samwise GIVING Temp.
    ADD Gandalf TO Temp GIVING Temp.
    SUBTRACT Boromir FROM Temp GIVING Temp.
    MULTIPLY Legolas BY Gimli GIVING Temp.
    DIVIDE Temp BY Aragorn GIVING Temp.

Display-Results.
    DISPLAY "The final result is: " Temp.
    DISPLAY "Thank you for joining us on this journey!".

