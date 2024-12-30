IDENTIFICATION DIVISION.
PROGRAM-ID. NumberGuessingGame.

* This program is a number guessing game.
* The user has to guess a number between 1 and 100.
* The program will indicate if the guess is too high or too low.
* The game continues until the user guesses the correct number.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  RandomNumber     PIC 99.
01  UserGuess        PIC 99.
01  Attempts         PIC 99 VALUE 0.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    PERFORM InitializeGame
    PERFORM UNTIL UserGuess = RandomNumber
     DISPLAY "Enter your guess (1-100): "
     ACCEPT UserGuess
     ADD 1 TO Attempts
     IF UserGuess > RandomNumber THEN
         DISPLAY "Too high!"
     ELSE IF UserGuess < RandomNumber THEN
         DISPLAY "Too low!"
     END-IF
    END-PERFORM
    DISPLAY "Congratulations! You guessed the number in " Attempts " attempts."
    STOP RUN.

InitializeGame.
    MOVE FUNCTION RANDOM(100) TO RandomNumber.

