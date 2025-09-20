IDENTIFICATION DIVISION.
PROGRAM-ID. NumberGuessingGame.

* This program is a number guessing game where the user tries to guess
* a randomly generated number between 1 and 100. The program will 
* provide feedback if the guess is too high or too low until the 
* correct number is guessed.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  RandomNumber     PIC 99.
01  UserGuess        PIC 99.
01  GuessCount       PIC 99 VALUE 0.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    PERFORM Initialize-RandomNumber
    DISPLAY "Welcome to the Number Guessing Game!"
    PERFORM UNTIL UserGuess = RandomNumber
     DISPLAY "Enter your guess (1-100): "
     ACCEPT UserGuess
     ADD 1 TO GuessCount
     IF UserGuess < RandomNumber THEN
         DISPLAY "Too low, try again."
     ELSE IF UserGuess > RandomNumber THEN
         DISPLAY "Too high, try again."
     END-IF
    END-PERFORM
    DISPLAY "Congratulations! You guessed the number in " GuessCount " tries."
    STOP RUN.

Initialize-RandomNumber.
    MOVE FUNCTION RANDOM(100) TO RandomNumber.

