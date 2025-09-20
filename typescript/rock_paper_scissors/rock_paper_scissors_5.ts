/**
 * This TypeScript program implements the classic game "Rock, Paper, Scissors".
 * The purpose of this program is to provide a simple example of how to use TypeScript
 * to create a command-line game. The program will prompt the user to enter their choice
 * of rock, paper, or scissors, and then randomly generate a choice for the computer.
 * The program will then determine the winner based on the rules of the game.
 */

import * as readline from 'readline';

// Create an interface for reading input from the command line
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

// Define the possible choices
const choices = ['rock', 'paper', 'scissors'];

// Function to get a random choice for the computer
function getComputerChoice(): string {
    const randomIndex = Math.floor(Math.random() * choices.length);
    return choices[randomIndex];
}

// Function to determine the winner
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

// Prompt the user for their choice
rl.question('Enter your choice (rock, paper, or scissors): ', (userChoice) => {
    userChoice = userChoice.toLowerCase();

    // Validate the user's choice
    if (!choices.includes(userChoice)) {
        console.log('Invalid choice. Please enter rock, paper, or scissors.');
    } else {
        const computerChoice = getComputerChoice();
        console.log(`Computer chose: ${computerChoice}`);
        const result = determineWinner(userChoice, computerChoice);
        console.log(result);
    }

    // Close the readline interface
    rl.close();
});

/***
 */