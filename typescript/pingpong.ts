/**
 * This TypeScript program simulates a simple ping-pong game.
 * The game involves two players who take turns hitting the ball back and forth.
 * The game continues until one player misses the ball.
 * The program keeps track of the score for each player and declares the winner at the end.
 * 
 * The PingPongGame class handles the game logic, including initializing the game,
 * updating the score, and determining the winner.
 * 
 * The Player class represents a player in the game, with properties for the player's name and score.
 * 
 * The main function initializes the game with two players and starts the game loop.
 */

class Player {
  name: string;
  score: number;

  constructor(name: string) {
    this.name = name;
    this.score = 0;
  }

  hitBall(): boolean {
    // Simulate hitting the ball with a 90% success rate
    return Math.random() < 0.9;
  }
}

class PingPongGame {
  player1: Player;
  player2: Player;

  constructor(player1: Player, player2: Player) {
    this.player1 = player1;
    this.player2 = player2;
  }

  startGame() {
    let currentPlayer = this.player1;
    while (true) {
      if (!currentPlayer.hitBall()) {
        this.updateScore(currentPlayer);
        break;
      }
      currentPlayer = currentPlayer === this.player1 ? this.player2 : this.player1;
    }
    this.declareWinner();
  }

  updateScore(player: Player) {
    if (player === this.player1) {
      this.player2.score++;
    } else {
      this.player1.score++;
    }
  }

  declareWinner() {
    if (this.player1.score > this.player2.score) {
      console.log(`${this.player1.name} wins with a score of ${this.player1.score}`);
    } else {
      console.log(`${this.player2.name} wins with a score of ${this.player2.score}`);
    }
  }
}

function main() {
  const player1 = new Player("Alice");
  const player2 = new Player("Bob");
  const game = new PingPongGame(player1, player2);
  game.startGame();
}

main();