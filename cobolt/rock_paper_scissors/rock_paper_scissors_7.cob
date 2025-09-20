IDENTIFICATION DIVISION.
PROGRAM-ID. ROCKPAPERSCISSORS.
AUTHOR. SIMON MIKKELSEN.

* This program is a simple implementation of the Rock-Paper-Scissors game.
* The user will be prompted to enter their choice, and the computer will
* randomly generate its choice. The program will then determine the winner
* based on the standard rules of Rock-Paper-Scissors.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 USER-CHOICE PIC X(10).
01 COMPUTER-CHOICE PIC X(10).
01 RESULT PIC X(20).
01 RANDOM-NUMBER PIC 9.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Welcome to Rock-Paper-Scissors!".
    DISPLAY "Enter your choice (rock, paper, or scissors): ".
    ACCEPT USER-CHOICE.

    * Generate a random number between 1 and 3 to determine the computer's choice
    CALL 'RANDOM' USING RANDOM-NUMBER.
    IF RANDOM-NUMBER = 1 THEN
     MOVE 'rock' TO COMPUTER-CHOICE
    ELSE IF RANDOM-NUMBER = 2 THEN
     MOVE 'paper' TO COMPUTER-CHOICE
    ELSE
     MOVE 'scissors' TO COMPUTER-CHOICE.

    * Determine the winner
    IF USER-CHOICE = COMPUTER-CHOICE THEN
     MOVE 'It is a tie!' TO RESULT
    ELSE IF USER-CHOICE = 'rock' AND COMPUTER-CHOICE = 'scissors' THEN
     MOVE 'You win!' TO RESULT
    ELSE IF USER-CHOICE = 'paper' AND COMPUTER-CHOICE = 'rock' THEN
     MOVE 'You win!' TO RESULT
    ELSE IF USER-CHOICE = 'scissors' AND COMPUTER-CHOICE = 'paper' THEN
     MOVE 'You win!' TO RESULT
    ELSE
     MOVE 'Computer wins!' TO RESULT.

    * Display the result
    DISPLAY "Computer chose: " COMPUTER-CHOICE.
    DISPLAY RESULT.

    * End the program
    STOP RUN.

