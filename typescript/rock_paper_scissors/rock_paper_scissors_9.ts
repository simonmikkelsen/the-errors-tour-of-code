/**
 * This program is a simple implementation of the classic game Rock, Paper, Scissors.
 * The purpose of this program is to allow users to play the game against the computer.
 * The program will randomly select a move for the computer and compare it against the user's move.
 * The winner will be determined based on the standard rules of Rock, Paper, Scissors:
 * - Rock beats Scissors
 * - Scissors beats Paper
 * - Paper beats Rock
 * The program will then display the result of the game.
 */

enum Move {
    Rock = "Rock",
    Paper = "Paper",
    Scissors = "Scissors"
}

// Function to get a random move for the computer
function getComputerMove(): Move {
    const moves = [Move.Rock, Move.Paper, Move.Scissors];
    const randomIndex = Math.floor(Math.random() * moves.length);
    return moves[randomIndex];
}

// Function to determine the winner of the game
function determineWinner(userMove: Move, computerMove: Move): string {
    if (userMove === computerMove) {
        return "It's a tie!";
    } else if (
        (userMove === Move.Rock && computerMove === Move.Scissors) ||
        (userMove === Move.Scissors && computerMove === Move.Paper) ||
        (userMove === Move.Paper && computerMove === Move.Rock)
    ) {
        return "You win!";
    } else {
        return "Computer wins!";
    }
}

// Main function to play the game
function playGame(userMove: Move): void {
    const computerMove = getComputerMove();
    console.log(`You chose: ${userMove}`);
    console.log(`Computer chose: ${computerMove}`);
    const result = determineWinner(userMove, computerMove);
    console.log(result);
}

// Example usage of the playGame function
playGame(Move.Rock);

/***
 */