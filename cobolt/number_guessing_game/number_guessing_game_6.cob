IDENTIFICATION DIVISION.
PROGRAM-ID. NumberGuessingGame.

* This program is a number guessing game.
* The user has to guess a number between 1 and 100.
* The program will provide feedback if the guess is too high or too low.
* The game continues until the user guesses the correct number.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  RandomNumber     PIC 99.
01  UserGuess        PIC 99.
01  GuessCount       PIC 99 VALUE 0.
01  InputString      PIC X(10).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    PERFORM InitializeGame
    PERFORM UNTIL UserGuess = RandomNumber
     DISPLAY "Enter your guess (1-100): "
     ACCEPT InputString
     MOVE FUNCTION NUMVAL(InputString) TO UserGuess
     ADD 1 TO GuessCount
     IF UserGuess < RandomNumber THEN
         DISPLAY "Too low!"
     ELSE IF UserGuess > RandomNumber THEN
         DISPLAY "Too high!"
     ELSE
         DISPLAY "Congratulations! You guessed the number in " GuessCount " tries."
     END-IF
    END-PERFORM
    STOP RUN.

InitializeGame.
    CALL 'RANDOM' USING RandomNumber
    COMPUTE RandomNumber = (RandomNumber MOD 100) + 1.

