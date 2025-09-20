IDENTIFICATION DIVISION.
PROGRAM-ID. RockPaperScissors.
AUTHOR. Simon Mikkelsen.

* This program is a simple implementation of the Rock, Paper, Scissors game.
* The user will be prompted to enter their choice, and the computer will randomly
* select its choice. The program will then determine the winner and display the result.
* The program is designed to be verbose and educational, with detailed comments
* explaining each section of the code.

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
    PERFORM UNTIL USER-CHOICE = "EXIT"
     DISPLAY "Enter your choice (Rock, Paper, Scissors) or type 'EXIT' to quit:"
     ACCEPT USER-CHOICE
     IF USER-CHOICE = "EXIT"
         EXIT PERFORM
     END-IF

     * Generate a random number between 1 and 3 to represent the computer's choice
     CALL 'RANDOM' USING RANDOM-NUMBER
     IF RANDOM-NUMBER = 1
         MOVE "Rock" TO COMPUTER-CHOICE
     ELSE IF RANDOM-NUMBER = 2
         MOVE "Paper" TO COMPUTER-CHOICE
     ELSE
         MOVE "Scissors" TO COMPUTER-CHOICE
     END-IF

     * Determine the result of the game
     IF USER-CHOICE = COMPUTER-CHOICE
         MOVE "It's a tie!" TO RESULT
     ELSE IF USER-CHOICE = "Rock" AND COMPUTER-CHOICE = "Scissors"
         MOVE "You win!" TO RESULT
     ELSE IF USER-CHOICE = "Paper" AND COMPUTER-CHOICE = "Rock"
         MOVE "You win!" TO RESULT
     ELSE IF USER-CHOICE = "Scissors" AND COMPUTER-CHOICE = "Paper"
         MOVE "You win!" TO RESULT
     ELSE
         MOVE "Computer wins!" TO RESULT
     END-IF

     * Display the result
     DISPLAY "Computer chose: " COMPUTER-CHOICE
     DISPLAY RESULT
    END-PERFORM.

    * End of the program
    DISPLAY "Thank you for playing Rock, Paper, Scissors!"
    STOP RUN.

