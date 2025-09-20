IDENTIFICATION DIVISION.
PROGRAM-ID. RockPaperScissors.
AUTHOR. Simon Mikkelsen.

* This program simulates a simple Rock, Paper, Scissors game.
* The user will be prompted to enter their choice, and the computer
* will randomly generate its choice. The program will then determine
* the winner based on the rules of the game.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 USER-CHOICE PIC X(10).
01 COMPUTER-CHOICE PIC X(10).
01 RESULT PIC X(20).
01 RANDOM-NUMBER PIC 9.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Welcome to Rock, Paper, Scissors!"
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
    CALL 'RANDOM' USING RANDOM-NUMBER
    IF RANDOM-NUMBER MOD 3 = 0
     MOVE "Rock" TO COMPUTER-CHOICE
    ELSE IF RANDOM-NUMBER MOD 3 = 1
     MOVE "Paper" TO COMPUTER-CHOICE
    ELSE
     MOVE "Scissors" TO COMPUTER-CHOICE.

DETERMINE-WINNER.
    IF USER-CHOICE = COMPUTER-CHOICE
     MOVE "It's a tie!" TO RESULT
    ELSE IF USER-CHOICE = "Rock" AND COMPUTER-CHOICE = "Scissors"
     MOVE "You win!" TO RESULT
    ELSE IF USER-CHOICE = "Paper" AND COMPUTER-CHOICE = "Rock"
     MOVE "You win!" TO RESULT
    ELSE IF USER-CHOICE = "Scissors" AND COMPUTER-CHOICE = "Paper"
     MOVE "You win!" TO RESULT
    ELSE
     MOVE "Computer wins!" TO RESULT.

