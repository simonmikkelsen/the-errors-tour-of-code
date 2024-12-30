IDENTIFICATION DIVISION.
PROGRAM-ID. RockPaperScissors.
AUTHOR. Simon Mikkelsen.

* This program simulates a game of Rock, Paper, Scissors.
* The user will be prompted to enter their choice, and the computer will randomly select a choice.
* The program will then determine the winner based on the rules of the game.
* The purpose of this program is to provide a simple example of user interaction and decision-making in COBOL.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 USER-CHOICE PIC X(10).
01 COMPUTER-CHOICE PIC X(10).
01 RESULT PIC X(20).
01 RANDOM-NUMBER PIC 9.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Welcome to Rock, Paper, Scissors!".
    PERFORM GET-USER-CHOICE.
    PERFORM GET-COMPUTER-CHOICE.
    PERFORM DETERMINE-WINNER.
    DISPLAY "You chose: " USER-CHOICE.
    DISPLAY "Computer chose: " COMPUTER-CHOICE.
    DISPLAY "Result: " RESULT.
    STOP RUN.

GET-USER-CHOICE.
    DISPLAY "Enter your choice (Rock, Paper, Scissors): ".
    ACCEPT USER-CHOICE.

GET-COMPUTER-CHOICE.
    CALL 'CBL_RANDOM' USING RANDOM-NUMBER.
    IF RANDOM-NUMBER MOD 3 = 0 THEN
     MOVE "Rock" TO COMPUTER-CHOICE
    ELSE IF RANDOM-NUMBER MOD 3 = 1 THEN
     MOVE "Paper" TO COMPUTER-CHOICE
    ELSE
     MOVE "Scissors" TO COMPUTER-CHOICE
    END-IF.

DETERMINE-WINNER.
    IF USER-CHOICE = COMPUTER-CHOICE THEN
     MOVE "It's a tie!" TO RESULT
    ELSE IF USER-CHOICE = "Rock" AND COMPUTER-CHOICE = "Scissors" THEN
     MOVE "You win!" TO RESULT
    ELSE IF USER-CHOICE = "Paper" AND COMPUTER-CHOICE = "Rock" THEN
     MOVE "You win!" TO RESULT
    ELSE IF USER-CHOICE = "Scissors" AND COMPUTER-CHOICE = "Paper" THEN
     MOVE "You win!" TO RESULT
    ELSE
     MOVE "Computer wins!" TO RESULT
    END-IF.

