IDENTIFICATION DIVISION.
PROGRAM-ID. NumberGuessingGame.

* This program is a number guessing game where the user tries to guess
* a randomly generated number between 1 and 100. The program will 
* provide feedback on whether the guess is too high, too low, or correct.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 RandomNumber     PIC 99.
01 UserGuess        PIC 99.
01 Attempts         PIC 99 VALUE 0.
01 LowerBound       PIC 99 VALUE 1.
01 UpperBound       PIC 99 VALUE 100.

PROCEDURE DIVISION.
Main-Logic.
    PERFORM Initialize-Game
    PERFORM UNTIL UserGuess = RandomNumber
     DISPLAY "Enter your guess (between 1 and 100): "
     ACCEPT UserGuess
     ADD 1 TO Attempts
     IF UserGuess < RandomNumber
         DISPLAY "Too low!"
     ELSE IF UserGuess > RandomNumber
         DISPLAY "Too high!"
     ELSE
         DISPLAY "Congratulations! You guessed the number in " 
              Attempts " attempts."
     END-IF
    END-PERFORM
    STOP RUN.

Initialize-Game.
    CALL 'RANDOM' USING BY CONTENT LowerBound, UpperBound
              BY REFERENCE RandomNumber
    SUBTRACT 1 FROM RandomNumber.

