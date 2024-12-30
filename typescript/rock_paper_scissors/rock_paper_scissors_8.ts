/**
 * This TypeScript program implements the classic game "Rock, Paper, Scissors".
 * The program allows a user to play against the computer.
 * The computer randomly selects one of the three options: rock, paper, or scissors.
 * The user inputs their choice, and the program determines the winner based on the rules:
 * - Rock beats Scissors
 * - Scissors beats Paper
 * - Paper beats Rock
 * The program also includes detailed comments to help understand each part of the code.
 */

function getComputerChoice(): string {
    const choices = ["rock", "paper", "scissors"];
    const randomIndex = Math.floor(Math.random() * choices.length);
    return choices[randomIndex];
}

function determineWinner(userChoice: string, computerChoice: string): string {
    if (userChoice === computerChoice) {
        return "It's a tie!";
    }

    if (
        (userChoice === "rock" && computerChoice === "scissors") ||
        (userChoice === "scissors" && computerChoice === "paper") ||
        (userChoice === "paper" && computerChoice === "rock")
    ) {
        return "You win!";
    } else {
        return "Computer wins!";
    }
}

// Function to start the game
function playGame() {
    // Prompt the user to enter their choice
    const userChoice = prompt("Enter your choice (rock, paper, or scissors):").toLowerCase();

    // Get the computer's choice
    const computerChoice = getComputerChoice();

    // Determine the winner
    const result = determineWinner(userChoice, computerChoice);

    // Display the result
    console.log(`You chose: ${userChoice}`);
    console.log(`The computer chose: ${computerChoice}`);
    console.log(result);
}

// Start the game
playGame();

/***
 */