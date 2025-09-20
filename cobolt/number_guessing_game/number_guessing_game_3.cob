IDENTIFICATION DIVISION.
PROGRAM-ID. NumberGuessingGame.
AUTHOR. Simon Mikkelsen.
* This program is a number guessing game where the user tries to guess
* a randomly generated number between 1 and 100. The program will provide
* feedback on whether the guess is too high, too low, or correct.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 RandomNumber      PIC 99.
01 UserGuess         PIC 99.
01 GuessCount        PIC 99 VALUE 0.
01 InputLine         PIC X(80).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    PERFORM InitializeGame
    PERFORM UNTIL UserGuess = RandomNumber
     DISPLAY "Enter your guess (1-100): "
     ACCEPT InputLine
     MOVE FUNCTION NUMVAL(InputLine) TO UserGuess
     ADD 1 TO GuessCount
     IF UserGuess < RandomNumber THEN
         DISPLAY "Too low!"
     ELSE IF UserGuess > RandomNumber THEN
         DISPLAY "Too high!"
     ELSE
         DISPLAY "Congratulations! You guessed the number in " GuessCount " tries."
     END-IF
    END-PERFORM
    PERFORM Cleanup
    STOP RUN.

InitializeGame.
    CALL 'CBL_RANDOM' USING BY CONTENT 100 BY REFERENCE RandomNumber.

Cleanup.
    * No resources to clean up in this simple program.
