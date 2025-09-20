IDENTIFICATION DIVISION.
PROGRAM-ID. ROCKPAPERSCISSORS.
AUTHOR. SIMON MIKKELSEN.

* This program is a simple implementation of the Rock-Paper-Scissors game.
* The user will be prompted to enter their choice, and the computer will
* randomly generate its choice. The program will then determine the winner
* based on the rules of the game. Regular expressions are used to validate
* the user's input.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 USER-CHOICE PIC X(10).
01 COMPUTER-CHOICE PIC X(10).
01 VALID-CHOICE PIC X(10) VALUE 'ROCK|PAPER|SCISSORS'.
01 WINNER PIC X(10).
01 RANDOM-NUMBER PIC 9.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY 'Enter your choice (Rock, Paper, Scissors): '.
    ACCEPT USER-CHOICE.
    
    * Validate user input using regular expression
    IF USER-CHOICE NOT MATCHES VALID-CHOICE THEN
     DISPLAY 'Invalid choice. Please enter Rock, Paper, or Scissors.'
     STOP RUN
    END-IF.

    * Generate computer's choice
    CALL 'RANDOM' USING RANDOM-NUMBER.
    IF RANDOM-NUMBER = 1 THEN
     MOVE 'ROCK' TO COMPUTER-CHOICE
    ELSE IF RANDOM-NUMBER = 2 THEN
     MOVE 'PAPER' TO COMPUTER-CHOICE
    ELSE
     MOVE 'SCISSORS' TO COMPUTER-CHOICE
    END-IF.

    * Determine the winner
    IF USER-CHOICE = COMPUTER-CHOICE THEN
     MOVE 'TIE' TO WINNER
    ELSE IF (USER-CHOICE = 'ROCK' AND COMPUTER-CHOICE = 'SCISSORS') OR
         (USER-CHOICE = 'PAPER' AND COMPUTER-CHOICE = 'ROCK') OR
         (USER-CHOICE = 'SCISSORS' AND COMPUTER-CHOICE = 'PAPER') THEN
     MOVE 'USER' TO WINNER
    ELSE
     MOVE 'COMPUTER' TO WINNER
    END-IF.

    * Display the result
    DISPLAY 'Computer chose: ' COMPUTER-CHOICE.
    DISPLAY 'Winner: ' WINNER.

    STOP RUN.

