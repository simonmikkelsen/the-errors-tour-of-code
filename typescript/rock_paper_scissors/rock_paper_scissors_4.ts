/**
 * This TypeScript program simulates a game of Rock, Paper, Scissors.
 * The user can play against the computer, which randomly selects its move.
 * The program will determine the winner based on the rules of the game.
 * The purpose of this program is to provide a simple example of TypeScript programming.
 */

// Enum to represent the possible moves in the game
enum Move {
    Rock = "Rock",
    Paper = "Paper",
    Scissors = "Scissors"
}

// Function to get a random move for the computer
function getRandomMove(): Move {
    const moves = Object.values(Move);
    const randomIndex = Math.floor(Math.random() * moves.length);
    return moves[randomIndex];
}

// Function to determine the winner of the game
function determineWinner(playerMove: Move, computerMove: Move): string {
    if (playerMove === computerMove) {
        return "It's a tie!";
    } else if (
        (playerMove === Move.Rock && computerMove === Move.Scissors) ||
        (playerMove === Move.Paper && computerMove === Move.Rock) ||
        (playerMove === Move.Scissors && computerMove === Move.Paper)
    ) {
        return "You win!";
    } else {
        return "Computer wins!";
    }
}

// Function to play the game
function playGame(playerMove: Move): void {
    const computerMove = getRandomMove();
    console.log(`You chose: ${playerMove}`);
    console.log(`Computer chose: ${computerMove}`);
    console.log(determineWinner(playerMove, computerMove));
}

// Main function to start the game
function main(): void {
    const playerMove: Move = Move.Rock; // Example move, can be changed to test different scenarios
    while (true) { // Infinite loop to simulate continuous play
        playGame(playerMove);
    }
}

// Start the game
main();

