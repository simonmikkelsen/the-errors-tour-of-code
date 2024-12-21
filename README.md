# the-errors-tour-of-code
Individual pieces of code that contain programming errors, meant for students and developers to train spotting errors. For that reason comments may say something else than the program does and not all files can compile or run individually.

# Errors

## C

### ping pong
1. The ball does not reset its position after scoring.
2. The game does not check for paddle collisions correctly.

## c++

### pingpong
1. The random number generator is not properly seeded, which can result in the same sequence of random numbers each time the program is run.
2. The condition to check for the winner is incorrect, which may cause the game to continue even after a player has won.

## Java

### pingpong

1. The Scanner object is not closed, which can lead to a resource leak.
2. The game does not handle the case where both players reach 21 points simultaneously.

## Java Script

### pingpong

1. The program does not handle invalid inputs (anything other than 'h' or 'm'), which can cause unexpected behavior.
2. The program does not reset the scores after the game ends, so if the game is played again without restarting the program, the scores will continue from the previous game.


## Go

### pingpong

1. The ball will not bounce correctly off the bottom and right edges due to the condition in move().
2. The screen clearing sequence may not work on all terminals.