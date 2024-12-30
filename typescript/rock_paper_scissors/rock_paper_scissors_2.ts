/**
 * This TypeScript program implements the classic game of Rock, Paper, Scissors.
 * The user can input their choice, and the computer will randomly select its choice.
 * The program will then determine the winner based on the rules of the game.
 * The purpose of this program is to provide a simple example of TypeScript programming,
 * including user input, random number generation, and conditional logic.
 */

enum Choice {
    Rock = "Rock",
    Paper = "Paper",
    Scissors = "Scissors"
}

// Function to get the computer's choice
function getComputerChoice(): Choice {
    const choices = [Choice.Rock, Choice.Paper, Choice.Scissors];
    const randomIndex = Math.floor(Math.random() * choices.length);
    return choices[randomIndex];
}

// Function to determine the winner
function determineWinner(userChoice: Choice, computerChoice: Choice): string {
    if (userChoice === computerChoice) {
        return "It's a tie!";
    } else if (
        (userChoice === Choice.Rock && computerChoice === Choice.Scissors) ||
        (userChoice === Choice.Paper && computerChoice === Choice.Rock) ||
        (userChoice === Choice.Scissors && computerChoice === Choice.Paper)
    ) {
        return "You win!";
    } else {
        return "Computer wins!";
    }
}

// Function to play the game
function playGame(userChoice: Choice): void {
    const computerChoice = getComputerChoice();
    console.log(`You chose: ${userChoice}`);
    console.log(`The computer chose: ${computerChoice}`);
    console.log(determineWinner(userChoice, computerChoice));
}

// Example of playing the game
const userChoice: Choice = Choice.Rock; // User's choice can be changed to test different scenarios
playGame(userChoice);

