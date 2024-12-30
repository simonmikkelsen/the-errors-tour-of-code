# the-errors-tour-of-code
Individual pieces of code that contain programming errors, meant for students and developers to train spotting errors. For that reason comments may say something else than the program does and not all files can compile or run individually.

# Errors

## C

### ping pong
1. The ball does not reset its position after scoring.
2. The game does not check for paddle collisions correctly.

## c++

### ping pong

1. Random number generator seeded with the same number all the time.
2. while loop should be (player1_score < 10 && player2_score < 10)

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

## PHP

### pingpong

1. The loop condition is incorrect, causing an off-by-one error.
2. The modulo operation is used incorrectly, causing the output to be incorrect.

## Python 3

### pingpong

1. The ball does not correctly bounce off the players' paddles. The condition to reverse the ball's direction when it hits a paddle is missing.
2. The players' paddles can move out of the table boundaries. There is no check to ensure the paddles stay within the table height.
3. Resource leak: The file 'game_log.txt' is opened in append mode in the main loop but never closed.

## Typescript

### pingpong

1. The game loop condition is incorrect, causing the game to never end.
2. The score update logic is flawed, leading to incorrect score calculation.
