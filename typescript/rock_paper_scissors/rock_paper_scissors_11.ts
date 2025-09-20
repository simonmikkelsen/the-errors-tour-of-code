/**
 * This TypeScript program implements the classic game of Rock, Paper, Scissors.
 * The purpose of this program is to provide a simple example of how to use TypeScript
 * to create a basic game with user input and random choices.
 * 
 * The program will:
 * 1. Prompt the user to enter their choice (rock, paper, or scissors).
 * 2. Generate a random choice for the computer.
 * 3. Determine the winner based on the rules of the game.
 * 4. Display the result to the user.
 */

import * as readline from 'readline';

// Create an interface for reading input from the console
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

// Function to get the computer's choice
function getComputerChoice(): string {
    const choices = ['rock', 'paper', 'scissors'];
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
        return 'Computer wins!';
    }
}

// Prompt the user for their choice
rl.question('Enter your choice (rock, paper, or scissors): ', (userChoice) => {
    userChoice = userChoice.toLowerCase();

    // Validate user input
    if (userChoice !== 'rock' && userChoice !== 'paper' && userChoice !== 'scissors') {
        console.log('Invalid choice. Please enter rock, paper, or scissors.');
        rl.close();
        return;
    }

    // Get the computer's choice
    const computerChoice = getComputerChoice();
    console.log(`Computer chose: ${computerChoice}`);

    // Determine the winner
    const result = determineWinner(userChoice, computerChoice);
    console.log(result);

    // Close the readline interface
    rl.close();
});

/**
 */