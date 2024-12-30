IDENTIFICATION DIVISION.
PROGRAM-ID. ROCKPAPERSCISSORS.
AUTHOR. SIMON MIKKELSEN.

* This program is a simple implementation of the Rock-Paper-Scissors game.
* The purpose of this program is to demonstrate basic COBOL programming concepts.
* The program allows a user to input their choice of rock, paper, or scissors.
* The computer randomly selects its choice, and the program determines the winner.
* The program includes detailed comments to help new programmers understand the code.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 USER-CHOICE PIC X(10).
01 COMPUTER-CHOICE PIC X(10).
01 RESULT PIC X(20).
01 RANDOM-NUMBER PIC 9.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Welcome to Rock-Paper-Scissors!".
    DISPLAY "Enter your choice (rock, paper, or scissors): ".
    ACCEPT USER-CHOICE.

    * Generate a random number between 1 and 3 to represent the computer's choice
    CALL 'CBL-RTS' USING BY CONTENT 1 BY REFERENCE RANDOM-NUMBER.
    IF RANDOM-NUMBER = 1
     MOVE "rock" TO COMPUTER-CHOICE
    ELSE IF RANDOM-NUMBER = 2
     MOVE "paper" TO COMPUTER-CHOICE
    ELSE
     MOVE "scissors" TO COMPUTER-CHOICE.

    * Determine the result of the game
    IF USER-CHOICE = COMPUTER-CHOICE
     MOVE "It's a tie!" TO RESULT
    ELSE IF USER-CHOICE = "rock"
     IF COMPUTER-CHOICE = "scissors"
         MOVE "You win!" TO RESULT
     ELSE
         MOVE "You lose!" TO RESULT
    ELSE IF USER-CHOICE = "paper"
     IF COMPUTER-CHOICE = "rock"
         MOVE "You win!" TO RESULT
     ELSE
         MOVE "You lose!" TO RESULT
    ELSE IF USER-CHOICE = "scissors"
     IF COMPUTER-CHOICE = "paper"
         MOVE "You win!" TO RESULT
     ELSE
         MOVE "You lose!" TO RESULT.

    * Display the result
    DISPLAY "Computer chose: " COMPUTER-CHOICE.
    DISPLAY RESULT.

    STOP RUN.

