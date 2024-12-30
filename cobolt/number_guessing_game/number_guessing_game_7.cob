IDENTIFICATION DIVISION.
PROGRAM-ID. NumberGuessingGame.
AUTHOR. Simon Mikkelsen.
* This program is a number guessing game where the user has to guess
* a randomly generated number between 1 and 100. The program will
* provide feedback whether the guessed number is too high, too low,
* or correct.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  RandomNumber     PIC 99.
01  UserGuess        PIC 99.
01  Attempts         PIC 99 VALUE 0.
01  EOF-SWITCH       PIC X VALUE 'N'.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    PERFORM INITIALIZE
    PERFORM GUESS-LOOP UNTIL EOF-SWITCH = 'Y'
    STOP RUN.

INITIALIZE.
    MOVE FUNCTION RANDOM(100) TO RandomNumber.

GUESS-LOOP.
    DISPLAY "Guess a number between 1 and 100: "
    ACCEPT UserGuess
    ADD 1 TO Attempts
    IF UserGuess = RandomNumber THEN
     DISPLAY "Congratulations! You guessed the correct number in " Attempts " attempts."
     MOVE 'Y' TO EOF-SWITCH
    ELSE
     IF UserGuess < RandomNumber THEN
         DISPLAY "Too low. Try again."
     ELSE
         DISPLAY "Too high. Try again."
     END-IF
    END-IF.

