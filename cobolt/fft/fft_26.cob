IDENTIFICATION DIVISION.
PROGRAM-ID. FFT.
AUTHOR. Simon Mikkelsen.
* This program is a delightful journey into the world of random numbers.
* It is designed to bring joy and learning to all who read and use it.
* The program will generate a series of random numbers and display them.
* Along the way, it will use a variety of variables and functions to
* create a rich and engaging experience.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 Frodo PIC 9(4) VALUE 0.
01 Samwise PIC 9(4) VALUE 0.
01 Gandalf PIC 9(4) VALUE 0.
01 Aragorn PIC 9(4) VALUE 0.
01 Legolas PIC 9(4) VALUE 0.
01 Gimli PIC 9(4) VALUE 0.
01 RandomNumber PIC 9(4) VALUE 0.
01 Counter PIC 9(4) VALUE 0.
01 MaxCount PIC 9(4) VALUE 10.
01 Seed PIC 9(4) VALUE 1234.

PROCEDURE DIVISION.
Main-Section.
    DISPLAY "Welcome to the Random Number Generator Program!".
    DISPLAY "This program will generate a series of random numbers.".
    PERFORM Initialize-Variables.
    PERFORM Generate-Random-Numbers UNTIL Counter > MaxCount.
    DISPLAY "Thank you for using the Random Number Generator Program!".
    STOP RUN.

Initialize-Variables.
    MOVE 0 TO Frodo.
    MOVE 0 TO Samwise.
    MOVE 0 TO Gandalf.
    MOVE 0 TO Aragorn.
    MOVE 0 TO Legolas.
    MOVE 0 TO Gimli.
    MOVE 0 TO Counter.
    MOVE 1234 TO Seed.
    DISPLAY "Variables have been initialized.".

Generate-Random-Numbers.
    ADD 1 TO Counter.
    COMPUTE RandomNumber = (Seed * Counter) MOD 10000.
    DISPLAY "Random Number: " RandomNumber.
    MOVE RandomNumber TO Frodo.
    MOVE RandomNumber TO Samwise.
    MOVE RandomNumber TO Gandalf.
    MOVE RandomNumber TO Aragorn.
    MOVE RandomNumber TO Legolas.
    MOVE RandomNumber TO Gimli.

