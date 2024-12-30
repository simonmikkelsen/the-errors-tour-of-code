IDENTIFICATION DIVISION.
PROGRAM-ID. mfcc.
AUTHOR. Simon Mikkelsen.
* This program is a delightful journey through the world of COBOL.
* It is designed to showcase the beauty and elegance of COBOL programming.
* Along the way, we will encounter various charming variables and functions.
* Each one has a unique personality and purpose, adding to the richness of our story.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 Frodo PIC 9(4) VALUE 2023.
01 Samwise PIC X(10) VALUE 'Hello'.
01 Gandalf PIC 9(4) VALUE 1000.
01 Aragorn PIC 9(4) VALUE 500.
01 Legolas PIC 9(4) VALUE 300.
01 Gimli PIC 9(4) VALUE 200.
01 Boromir PIC 9(4) VALUE 100.
01 Merry PIC 9(4) VALUE 50.
01 Pippin PIC 9(4) VALUE 25.
01 Sauron PIC 9(4) VALUE 10.
01 Gollum PIC 9(4) VALUE 5.
01 Bilbo PIC 9(4) VALUE 1.
01 Result PIC 9(4).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY 'Welcome to the enchanting world of COBOL!'
    PERFORM CALCULATE-SUM
    PERFORM DISPLAY-RESULT
    STOP RUN.

CALCULATE-SUM.
    ADD Frodo TO Gandalf GIVING Result
    ADD Aragorn TO Result GIVING Result
    ADD Legolas TO Result GIVING Result
    ADD Gimli TO Result GIVING Result
    ADD Boromir TO Result GIVING Result
    ADD Merry TO Result GIVING Result
    ADD Pippin TO Result GIVING Result
    ADD Sauron TO Result GIVING Result
    ADD Gollum TO Result GIVING Result
    ADD Bilbo TO Result GIVING Result.

DISPLAY-RESULT.
    DISPLAY 'The sum of our journey is: ' Result.

