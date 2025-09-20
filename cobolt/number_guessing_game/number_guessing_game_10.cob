IDENTIFICATION DIVISION.
PROGRAM-ID. NumberGuessingGame.

* This program is a number guessing game where the user tries to guess
* a randomly generated number between 1 and 100. The program will 
* provide feedback on whether the guess is too high, too low, or correct.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 RANDOM-NUMBER        PIC 99.
01 USER-GUESS           PIC 99.
01 GUESS-COUNT          PIC 99 VALUE 0.
01 INPUT-VALUE          PIC X(10).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    PERFORM INITIALIZE-GAME
    PERFORM UNTIL USER-GUESS = RANDOM-NUMBER
     DISPLAY "Enter your guess (1-100): "
     ACCEPT INPUT-VALUE
     MOVE INPUT-VALUE TO USER-GUESS
     ADD 1 TO GUESS-COUNT
     IF USER-GUESS < RANDOM-NUMBER
         DISPLAY "Too low, try again."
     ELSE IF USER-GUESS > RANDOM-NUMBER
         DISPLAY "Too high, try again."
     ELSE
         DISPLAY "Congratulations! You guessed the number in " GUESS-COUNT " tries."
     END-IF
    END-PERFORM
    STOP RUN.

INITIALIZE-GAME.
    CALL 'RANDOM' USING BY CONTENT 100 GIVING RANDOM-NUMBER.

