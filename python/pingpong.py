import time
import os

"""
This is a Ping-Pong game simulation program. The program simulates a simple game of Ping-Pong
between two players. The game is played on a rectangular table, and the ball bounces back and forth
between the players. The players try to hit the ball back to the opponent, and the game continues
until one of the players misses the ball.

The program uses a simple text-based interface to display the game state. The table is represented
by a grid of characters, and the ball and players are represented by specific characters. The ball
moves across the table, and the players move up and down to hit the ball.
"""

# Constants
TABLE_WIDTH = 40
TABLE_HEIGHT = 10
BALL_CHAR = 'O'
PLAYER_CHAR = '|'
EMPTY_CHAR = ' '

# Initial positions
ball_x = TABLE_WIDTH // 2
ball_y = TABLE_HEIGHT // 2
ball_dx = 1
ball_dy = 1
player1_y = TABLE_HEIGHT // 2
player2_y = TABLE_HEIGHT // 2

def draw_table():
  os.system('clear')
  for y in range(TABLE_HEIGHT):
    for x in range(TABLE_WIDTH):
      if x == ball_x and y == ball_y:
        print(BALL_CHAR, end='')
      elif x == 0 and y == player1_y:
        print(PLAYER_CHAR, end='')
      elif x == TABLE_WIDTH - 1 and y == player2_y:
        print(PLAYER_CHAR, end='')
      else:
        print(EMPTY_CHAR, end='')
    print()

def update_ball():
  global ball_x, ball_y, ball_dx, ball_dy
  ball_x += ball_dx
  ball_y += ball_dy

  if ball_y <= 0 or ball_y >= TABLE_HEIGHT - 1:
    ball_dy = -ball_dy

  if ball_x <= 0 or ball_x >= TABLE_WIDTH - 1:
    ball_dx = -ball_dx

def update_players():
  global player1_y, player2_y
  if ball_y < player1_y:
    player1_y -= 1
  elif ball_y > player1_y:
    player1_y += 1

  if ball_y < player2_y:
    player2_y -= 1
  elif ball_y > player2_y:
    player2_y += 1

def main():
  while True:
    draw_table()
    update_ball()
    update_players()
    time.sleep(0.1)
    f = open('game_log.txt', 'a')
    f.write(f'Ball position: ({ball_x}, {ball_y})\n')

if __name__ == "__main__":
  main()
