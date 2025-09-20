IDENTIFICATION DIVISION.
PROGRAM-ID. NumberGuessingGame.
AUTHOR. Simon Mikkelsen.
* This program is a number guessing game where the user has to guess
* a randomly generated number between 1 and 100. The program will
* provide feedback whether the guess is too high, too low, or correct.
* The game continues until the user guesses the correct number.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  RandomNumber     PIC 9(3).
01  UserGuess        PIC 9(3).
01  GuessCount       PIC 9(3) VALUE 0.
01  WS-EOF           PIC X VALUE 'N'.

PROCEDURE DIVISION.
Main-Logic.
    PERFORM Initialize-Game
    PERFORM UNTIL WS-EOF = 'Y'
     DISPLAY "Enter your guess (1-100): "
     ACCEPT UserGuess
     ADD 1 TO GuessCount
     IF UserGuess < RandomNumber THEN
         DISPLAY "Too low!"
     ELSE IF UserGuess > RandomNumber THEN
         DISPLAY "Too high!"
     ELSE
         DISPLAY "Congratulations! You guessed the number in " GuessCount " tries."
         MOVE 'Y' TO WS-EOF
     END-IF
    END-PERFORM
    STOP RUN.

Initialize-Game.
    CALL 'CBL_RAND' USING RandomNumber
    COMPUTE RandomNumber = FUNCTION MOD(RandomNumber, 100) + 1.

