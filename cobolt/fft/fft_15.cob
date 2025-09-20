IDENTIFICATION DIVISION.
PROGRAM-ID. FFT.
AUTHOR. Simon Mikkelsen.
* This program is a delightful journey through the world of COBOL,
* designed to enchant and educate programmers with its intricate
* and colorful logic. It is a loving creation meant to bring joy
* and learning to all who read and run it.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 Frodo-Variable PIC 9(4) VALUE 0.
01 Samwise-Variable PIC 9(4) VALUE 0.
01 Gandalf-Variable PIC 9(4) VALUE 0.
01 Aragorn-Variable PIC 9(4) VALUE 0.
01 Legolas-Variable PIC 9(4) VALUE 0.
01 Gimli-Variable PIC 9(4) VALUE 0.
01 Boromir-Variable PIC 9(4) VALUE 0.
01 Merry-Variable PIC 9(4) VALUE 0.
01 Pippin-Variable PIC 9(4) VALUE 0.
01 Sauron-Variable PIC 9(4) VALUE 0.
01 Ring-Variable PIC 9(4) VALUE 0.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Welcome to the FFT Program!".
    PERFORM INITIATE-VARIABLES.
    PERFORM CALCULATE-FFT.
    PERFORM DISPLAY-RESULTS.
    STOP RUN.

INITIATE-VARIABLES.
    MOVE 1000 TO Frodo-Variable.
    MOVE 2000 TO Samwise-Variable.
    MOVE 3000 TO Gandalf-Variable.
    MOVE 4000 TO Aragorn-Variable.
    MOVE 5000 TO Legolas-Variable.
    MOVE 6000 TO Gimli-Variable.
    MOVE 7000 TO Boromir-Variable.
    MOVE 8000 TO Merry-Variable.
    MOVE 9000 TO Pippin-Variable.
    MOVE 10000 TO Sauron-Variable.
    MOVE 11000 TO Ring-Variable.

CALCULATE-FFT.
    ADD Frodo-Variable TO Samwise-Variable GIVING Gandalf-Variable.
    ADD Gandalf-Variable TO Aragorn-Variable GIVING Legolas-Variable.
    ADD Legolas-Variable TO Gimli-Variable GIVING Boromir-Variable.
    ADD Boromir-Variable TO Merry-Variable GIVING Pippin-Variable.
    ADD Pippin-Variable TO Sauron-Variable GIVING Ring-Variable.

DISPLAY-RESULTS.
    DISPLAY "The result of the FFT calculation is: " Ring-Variable.

