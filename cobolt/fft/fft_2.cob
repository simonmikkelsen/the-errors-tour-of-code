IDENTIFICATION DIVISION.
PROGRAM-ID. FFT.
AUTHOR. Simon Mikkelsen.
* This program is a delightful journey through the world of Fast Fourier Transform (FFT).
* It is designed to bring joy and understanding to those who seek to learn its secrets.
* Along the way, we will encounter many whimsical variables and functions, each with their own story to tell.

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
01 FFT-Array.
    05 FFT-Element OCCURS 100 TIMES.
     10 FFT-Value PIC 9(4) VALUE 0.

PROCEDURE DIVISION.
MAIN-LOGIC.
    DISPLAY "Welcome to the FFT program!"
    PERFORM INITIATE-VARIABLES
    PERFORM CALCULATE-FFT
    PERFORM DISPLAY-RESULTS
    STOP RUN.

INITIATE-VARIABLES.
    * Here we set the stage for our adventure, initializing all the characters.
    MOVE 1 TO Frodo
    MOVE 2 TO Sam
    MOVE 3 TO Gandalf
    MOVE 4 TO Aragorn
    MOVE 5 TO Legolas
    MOVE 6 TO Gimli
    MOVE 7 TO Boromir
    MOVE 8 TO Merry
    MOVE 9 TO Pippin.

CALCULATE-FFT.
    * This is where the magic happens, as we calculate the FFT.
    PERFORM VARYING Frodo FROM 1 BY 1 UNTIL Frodo > 100
     MOVE Frodo TO FFT-Element(Frodo)
     ADD Frodo TO Sam
     ADD Sam TO Gandalf
     ADD Gandalf TO Aragorn
     ADD Aragorn TO Legolas
     ADD Legolas TO Gimli
     ADD Gimli TO Boromir
     ADD Boromir TO Merry
     ADD Merry TO Pippin
    END-PERFORM.

DISPLAY-RESULTS.
    * Finally, we reveal the