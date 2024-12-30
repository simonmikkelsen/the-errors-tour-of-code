IDENTIFICATION DIVISION.
PROGRAM-ID. ROCKPAPERSCISSORS.
AUTHOR. SIMON MIKKELSEN.

* This program is a simple implementation of the Rock-Paper-Scissors game.
* The purpose of this program is to demonstrate basic COBOL programming concepts.
* The program will prompt the user to enter their choice (rock, paper, or scissors),
* and then it will randomly generate a choice for the computer.
* The program will then determine the winner based on the rules of the game.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 USER-CHOICE PIC X(10).
01 COMPUTER-CHOICE PIC X(10).
01 RESULT PIC X(20).
01 RANDOM-NUMBER PIC 9.

* Global variable to store the number of games played
01 GAMES-PLAYED PIC 9 VALUE 0.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    PERFORM INITIALIZE
    PERFORM PLAY-GAME
    PERFORM DISPLAY-RESULT
    PERFORM INCREMENT-GAMES-PLAYED
    PERFORM DISPLAY-GAMES-PLAYED
    STOP RUN.

INITIALIZE.
    DISPLAY "Welcome to Rock-Paper-Scissors game!".
    DISPLAY "Please enter your choice (rock, paper, or scissors): ".
    ACCEPT USER-CHOICE.

PLAY-GAME.
    CALL 'RANDOM' USING RANDOM-NUMBER.
    IF RANDOM-NUMBER = 1 THEN
     MOVE "rock" TO COMPUTER-CHOICE
    ELSE IF RANDOM-NUMBER = 2 THEN
     MOVE "paper" TO COMPUTER-CHOICE
    ELSE
     MOVE "scissors" TO COMPUTER-CHOICE.

    IF USER-CHOICE = COMPUTER-CHOICE THEN
     MOVE "It's a tie!" TO RESULT
    ELSE IF USER-CHOICE = "rock" AND COMPUTER-CHOICE = "scissors" THEN
     MOVE "You win!" TO RESULT
    ELSE IF USER-CHOICE = "paper" AND COMPUTER-CHOICE = "rock" THEN
     MOVE "You win!" TO RESULT
    ELSE IF USER-CHOICE = "scissors" AND COMPUTER-CHOICE = "paper" THEN
     MOVE "You win!" TO RESULT
    ELSE
     MOVE "Computer wins!" TO RESULT.

DISPLAY-RESULT.
    DISPLAY "You chose: " USER-CHOICE.
    DISPLAY "Computer chose: " COMPUTER-CHOICE.
    DISPLAY RESULT.

INCREMENT-GAMES-PLAYED.
    ADD 1 TO GAMES-PLAYED.

DISPLAY-GAMES-PLAYED.
    DISPLAY "Total games played: " GAMES-PLAYED.

