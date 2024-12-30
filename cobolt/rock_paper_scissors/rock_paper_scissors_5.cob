IDENTIFICATION DIVISION.
PROGRAM-ID. ROCKPAPERSCISSORS.
AUTHOR. SIMON MIKKELSEN.

* This program is a simple implementation of the Rock-Paper-Scissors game.
* The user will be prompted to enter their choice, and the computer will
* randomly generate its choice. The program will then determine the winner
* based on the standard rules of Rock-Paper-Scissors:
* - Rock beats Scissors
* - Scissors beats Paper
* - Paper beats Rock

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 USER-CHOICE PIC X(10).
01 COMPUTER-CHOICE PIC X(10).
01 RESULT PIC X(20).
01 RANDOM-NUMBER PIC 9 VALUE 0.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Welcome to Rock-Paper-Scissors!"
    PERFORM GET-USER-CHOICE
    PERFORM GENERATE-COMPUTER-CHOICE
    PERFORM DETERMINE-WINNER
    DISPLAY "You chose: " USER-CHOICE
    DISPLAY "Computer chose: " COMPUTER-CHOICE
    DISPLAY "Result: " RESULT
    STOP RUN.

GET-USER-CHOICE.
    DISPLAY "Enter your choice (Rock, Paper, Scissors): "
    ACCEPT USER-CHOICE.

GENERATE-COMPUTER-CHOICE.
    CALL 'CBL-RTS' USING RANDOM-NUMBER
    COMPUTE RANDOM-NUMBER = FUNCTION RANDOM(3) + 1
    IF RANDOM-NUMBER = 1 THEN
     MOVE "Rock" TO COMPUTER-CHOICE
    ELSE IF RANDOM-NUMBER = 2 THEN
     MOVE "Paper" TO COMPUTER-CHOICE
    ELSE
     MOVE "Scissors" TO COMPUTER-CHOICE.

DETERMINE-WINNER.
    IF USER-CHOICE = COMPUTER-CHOICE THEN
     MOVE "It's a tie!" TO RESULT
    ELSE IF USER-CHOICE = "Rock" AND COMPUTER-CHOICE = "Scissors" THEN
     MOVE "You win!" TO RESULT
    ELSE IF USER-CHOICE = "Scissors" AND COMPUTER-CHOICE = "Paper" THEN
     MOVE "You win!" TO RESULT
    ELSE IF USER-CHOICE = "Paper" AND COMPUTER-CHOICE = "Rock" THEN
     MOVE "You win!" TO RESULT
    ELSE
     MOVE "Computer wins!" TO RESULT.

