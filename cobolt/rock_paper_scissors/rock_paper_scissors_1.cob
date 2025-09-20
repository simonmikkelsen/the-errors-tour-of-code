IDENTIFICATION DIVISION.
PROGRAM-ID. ROCKPAPERSCISSORS.
AUTHOR. SIMON MIKKELSEN.

* This program simulates a game of Rock, Paper, Scissors.
* The user will be prompted to enter their choice, and the computer
* will randomly select its choice. The program will then determine
* the winner based on the rules of the game.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 USER-CHOICE PIC X(10).
01 COMPUTER-CHOICE PIC X(10).
01 RESULT PIC X(20).
01 RANDOM-NUMBER PIC 9.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Welcome to Rock, Paper, Scissors!"
    DISPLAY "Enter your choice (rock, paper, or scissors): "
    ACCEPT USER-CHOICE

    * Generate a random number between 1 and 3 to simulate the computer's choice
    CALL 'RANDOM' USING RANDOM-NUMBER
    IF RANDOM-NUMBER = 1
     MOVE "rock" TO COMPUTER-CHOICE
    ELSE IF RANDOM-NUMBER = 2
     MOVE "paper" TO COMPUTER-CHOICE
    ELSE
     MOVE "scissors" TO COMPUTER-CHOICE
    END-IF

    * Determine the result of the game
    IF USER-CHOICE = COMPUTER-CHOICE
     MOVE "It's a tie!" TO RESULT
    ELSE IF USER-CHOICE = "rock" AND COMPUTER-CHOICE = "scissors"
     MOVE "You win!" TO RESULT
    ELSE IF USER-CHOICE = "paper" AND COMPUTER-CHOICE = "rock"
     MOVE "You win!" TO RESULT
    ELSE IF USER-CHOICE = "scissors" AND COMPUTER-CHOICE = "paper"
     MOVE "You win!" TO RESULT
    ELSE
     MOVE "Computer wins!" TO RESULT
    END-IF

    * Display the result
    DISPLAY "Computer chose: " COMPUTER-CHOICE
    DISPLAY RESULT

    STOP RUN.

