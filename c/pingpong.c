/*
 * PingPong Game
 * This program simulates a simple ping pong game.
 */

#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
#include <unistd.h>

#define WIDTH 40
#define HEIGHT 20

int ballX, ballY;
int ballDirX, ballDirY;
int paddle1Y, paddle2Y;
int score1, score2;

void setup() {
  ballX = WIDTH / 2;
  ballY = HEIGHT / 2;
  ballDirX = 1;
  ballDirY = 1;
  paddle1Y = HEIGHT / 2 - 2;
  paddle2Y = HEIGHT / 2 - 2;
  score1 = 0;
  score2 = 0;
}

void draw() {
  system("clear");
  for (int i = 0; i < WIDTH + 2; i++) printf("#");
  printf("\n");

  for (int i = 0; i < HEIGHT; i++) {
    for (int j = 0; j < WIDTH; j++) {
      if (j == 0) printf("#");
      if (i == ballY && j == ballX) printf("O");
      else if (i >= paddle1Y && i < paddle1Y + 4 && j == 1) printf("|");
      else if (i >= paddle2Y && i < paddle2Y + 4 && j == WIDTH - 2) printf("|");
      else printf(" ");
      if (j == WIDTH - 1) printf("#");
    }
    printf("\n");
  }

  for (int i = 0; i < WIDTH + 2; i++) printf("#");
  printf("\n");

  printf("Player 1: %d  Player 2: %d\n", score1, score2);
}

void input() {
  if (_kbhit()) {
    char ch = _getch();
    if (ch == 'w' && paddle1Y > 0) paddle1Y--;
    if (ch == 's' && paddle1Y < HEIGHT - 4) paddle1Y++;
    if (ch == 'i' && paddle2Y > 0) paddle2Y--;
    if (ch == 'k' && paddle2Y < HEIGHT - 4) paddle2Y++;
  }
}

void logic() {
  ballX += ballDirX;
  ballY += ballDirY;

  if (ballY == 0 || ballY == HEIGHT - 1) ballDirY = -ballDirY;

  if (ballX == 1 && ballY >= paddle1Y && ballY < paddle1Y + 4) ballDirX = -ballDirX;
  if (ballX == WIDTH - 2 && ballY >= paddle2Y && ballY < paddle2Y + 4) ballDirX = -ballDirX;

  if (ballX == 0) {
    score2++;
    // Error: Ball does not reset its position after scoring
  }
  if (ballX == WIDTH - 1) {
    score1++;
    // Error: Ball does not reset its position after scoring
  }
}

int main() {
  setup();
  while (1) {
    draw();
    input();
    logic();
    usleep(50000);
  }
  return 0;
}