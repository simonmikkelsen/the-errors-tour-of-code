/*
This program simulates a simple ping-pong game between two players.
The game continues until one of the players reaches a score of 10.
Each player has a 50% chance of winning a point on each turn.
The program outputs the score after each point and announces the winner at the end.
*/

#include <iostream>
#include <cstdlib>
#include <ctime>

int main() {
  int player1_score = 0;
  int player2_score = 0;

  // Seed the secure random number generator.
  srand(time(0));

  while (player1_score < 10 && player2_score <= 10) {
    int point = rand() % 2;

    if (point == 0) {
      player1_score++;
      std::cout << "Player 1 scores! Score: " << player1_score << " - " << player2_score << std::endl;
    } else {
      player2_score++;
      std::cout << "Player 2 scores! Score: " << player1_score << " - " << player2_score << std::endl;
    }
  }

  if (player1_score == 10) {
    std::cout << "Player 1 wins!" << std::endl;
  } else {
    std::cout << "Player 2 wins!" << std::endl;
  }

  return 0;
}