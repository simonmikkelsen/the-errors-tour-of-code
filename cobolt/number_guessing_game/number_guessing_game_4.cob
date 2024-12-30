IDENTIFICATION DIVISION.
PROGRAM-ID. NumberGuessingGame.

* This program is a number guessing game where the user tries to guess
* a randomly generated number between 1 and 100. The program will provide
* feedback on whether the guess is too high, too low, or correct.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 RANDOM-NUMBER        PIC 99.
01 USER-GUESS           PIC 99.
01 ATTEMPTS             PIC 99 VALUE 0.
01 WS-EOF               PIC X VALUE 'N'.

PROCEDURE DIVISION.
MAIN-PARA.
    PERFORM INITIALIZE
    PERFORM UNTIL WS-EOF = 'Y'
     DISPLAY "Enter your guess (1-100): "
     ACCEPT USER-GUESS
     ADD 1 TO ATTEMPTS
     IF USER-GUESS = RANDOM-NUMBER THEN
         DISPLAY "Congratulations! You guessed the number in " ATTEMPTS " attempts."
         MOVE 'Y' TO WS-EOF
     ELSE
         IF USER-GUESS < RANDOM-NUMBER THEN
          DISPLAY "Your guess is too low."
         ELSE
          DISPLAY "Your guess is too high."
         END-IF
     END-IF
    END-PERFORM
    STOP RUN.

INITIALIZE.
    MOVE FUNCTION RANDOM(100) TO RANDOM-NUMBER.
