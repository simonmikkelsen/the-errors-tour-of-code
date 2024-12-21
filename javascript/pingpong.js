/**
 * A text-based Ping Pong game for experienced programmers to learn to spot errors.
 * The game prompts two players to input whether they hit or miss the ball.
 * The first player to reach the winning score wins the game.
 */
const readline = require('readline');

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

let player1Score = 0;
let player2Score = 0;
const winningScore = 5;

function printScores() {
  console.log(`Player 1: ${player1Score} - Player 2: ${player2Score}`);
}

function playRound() {
  rl.question('Player 1, hit or miss? (h/m): ', (player1Input) => {
    if (player1Input === 'h') {
      player1Score++;
    }

    rl.question('Player 2, hit or miss? (h/m): ', (player2Input) => {
      if (player2Input === 'h') {
        player2Score++;
      }

      printScores();

      if (player1Score >= winningScore || player2Score >= winningScore) {
        console.log('Game Over!');
        rl.close();
      } else {
        playRound();
      }
    });
  });
}

console.log('Welcome to Ping Pong!');
playRound();