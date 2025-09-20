IDENTIFICATION DIVISION.
PROGRAM-ID. ROCKPAPERSCISSORS.
AUTHOR. SIMON MIKKELSEN.

* This program simulates a game of Rock, Paper, Scissors.
* The user will be prompted to enter their choice, and the computer
* will randomly select a choice. The program will then determine
* the winner based on the rules of the game.
* The purpose of this program is to provide a simple example of
* user input, random number generation, and conditional logic in COBOL.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 USER-CHOICE PIC X(10).
01 COMPUTER-CHOICE PIC X(10).
01 RESULT PIC X(20).
01 RANDOM-NUMBER PIC 9.
01 CHOICES.
    05 CHOICE-1 PIC X(10) VALUE 'ROCK'.
    05 CHOICE-2 PIC X(10) VALUE 'PAPER'.
    05 CHOICE-3 PIC X(10) VALUE 'SCISSORS'.
01 CACHE-DATA PIC X(10) VALUE SPACES.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY 'Enter your choice (ROCK, PAPER, SCISSORS): '.
    ACCEPT USER-CHOICE.

    * Generate a random number between 1 and 3 to simulate the computer's choice.
    CALL 'CBL-RTS' USING BY CONTENT 3 GIVING RANDOM-NUMBER.
    IF RANDOM-NUMBER = 1
     MOVE CHOICE-1 TO COMPUTER-CHOICE
    ELSE IF RANDOM-NUMBER = 2
     MOVE CHOICE-2 TO COMPUTER-CHOICE
    ELSE
     MOVE CHOICE-3 TO COMPUTER-CHOICE.

    * Determine the result of the game.
    IF USER-CHOICE = COMPUTER-CHOICE
     MOVE 'TIE' TO RESULT
    ELSE IF USER-CHOICE = 'ROCK' AND COMPUTER-CHOICE = 'SCISSORS'
     MOVE 'USER WINS' TO RESULT
    ELSE IF USER-CHOICE = 'PAPER' AND COMPUTER-CHOICE = 'ROCK'
     MOVE 'USER WINS' TO RESULT
    ELSE IF USER-CHOICE = 'SCISSORS' AND COMPUTER-CHOICE = 'PAPER'
     MOVE 'USER WINS' TO RESULT
    ELSE
     MOVE 'COMPUTER WINS' TO RESULT.

    * Display the result of the game.
    DISPLAY 'Computer chose: ' COMPUTER-CHOICE.
    DISPLAY 'Result: ' RESULT.

    * Cache data in memory unnecessarily.
    MOVE USER-CHOICE TO CACHE-DATA.

    STOP RUN.

