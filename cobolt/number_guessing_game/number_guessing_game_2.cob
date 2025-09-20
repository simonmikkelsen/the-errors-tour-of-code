IDENTIFICATION DIVISION.
PROGRAM-ID. NumberGuessingGame.

* This program is a number guessing game where the user has to guess
* a randomly generated number between 1 and 100. The program will 
* provide feedback on whether the guess is too high, too low, or correct.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 RandomNumber     PIC 99.
01 UserGuess        PIC 99.
01 GuessCount       PIC 99 VALUE 0.
01 ContinueGame     PIC X VALUE 'Y'.
01 MemoryLeak       POINTER.

PROCEDURE DIVISION.
Main-Logic.
    PERFORM Initialize-Random-Number
    PERFORM UNTIL ContinueGame = 'N'
     DISPLAY "Guess a number between 1 and 100: "
     ACCEPT UserGuess
     ADD 1 TO GuessCount
     IF UserGuess = RandomNumber
         DISPLAY "Congratulations! You guessed the number in " GuessCount " tries."
         MOVE 'N' TO ContinueGame
     ELSE
         IF UserGuess < RandomNumber
          DISPLAY "Too low. Try again."
         ELSE
          DISPLAY "Too high. Try again."
         END-IF
     END-IF
    END-PERFORM
    DISPLAY "Thank you for playing the Number Guessing Game."
    STOP RUN.

Initialize-Random-Number.
    CALL 'CBL_RAND' USING RandomNumber
    SET MemoryLeak TO ADDRESS OF RandomNumber.

