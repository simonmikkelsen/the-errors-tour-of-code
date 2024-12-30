/**
 * This program is a simple implementation of the classic game Rock, Paper, Scissors.
 * The purpose of this program is to provide a basic example of how to use TypeScript
 * to create a command-line game. The game allows a user to input their choice of rock,
 * paper, or scissors, and then the computer randomly selects its choice. The program
 * then determines the winner based on the rules of the game.
 */

import * as readline from 'readline';

// Create an interface for the readline module to handle user input
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

// Define the possible choices in the game
const choices = ['rock', 'paper', 'scissors'];

// Function to get the computer's choice
function getComputerChoice(): string {
    const randomIndex = Math.floor(Math.random() * choices.length);
    return choices[randomIndex];
}

// Function to determine the winner of the game
function determineWinner(userChoice: string, computerChoice: string): string {
    if (userChoice === computerChoice) {
        return 'It\'s a tie!';
    } else if (
        (userChoice === 'rock' && computerChoice === 'scissors') ||
        (userChoice === 'paper' && computerChoice === 'rock') ||
        (userChoice === 'scissors' && computerChoice === 'paper')
    ) {
        return 'You win!';
    } else {
        return 'You lose!';
    }
}

// Function to start the game
function startGame(): void {
    rl.question('Enter your choice (rock, paper, or scissors): ', (userChoice) => {
        // Convert user input to lowercase to handle case sensitivity
        userChoice = userChoice.toLowerCase();

        // Validate user input
        if (!choices.includes(userChoice)) {
            console.log('Invalid choice. Please enter rock, paper, or scissors.');
            startGame(); // Restart the game if the input is invalid
        } else {
            const computerChoice = getComputerChoice();
            console.log(`Computer chose: ${computerChoice}`);
            const result = determineWinner(userChoice, computerChoice);
            console.log(result);
            rl.close(); // Close the readline interface after the game ends
        }
    });
}

// Start the game by calling the startGame function
startGame();

/***
 */