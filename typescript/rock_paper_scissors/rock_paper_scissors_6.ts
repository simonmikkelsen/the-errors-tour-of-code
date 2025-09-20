/**
 * This TypeScript program implements the classic game "Rock, Paper, Scissors".
 * The purpose of this program is to provide a simple example of how to use TypeScript
 * to create a command-line game. The program will prompt the user to enter their choice
 * of "rock", "paper", or "scissors", and then randomly generate a choice for the computer.
 * The program will then determine the winner based on the rules of the game.
 */

import * as readline from 'readline';

// Create an interface for reading input from the command line
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
        return "It's a tie!";
    }
    if (
        (userChoice === 'rock' && computerChoice === 'scissors') ||
        (userChoice === 'paper' && computerChoice === 'rock') ||
        (userChoice === 'scissors' && computerChoice === 'paper')
    ) {
        return 'You win!';
    }
    return 'You lose!';
}

// Prompt the user for their choice
rl.question('Enter your choice (rock, paper, or scissors): ', (userChoice) => {
    const computerChoice = getComputerChoice();
    console.log(`Computer chose: ${computerChoice}`);
    console.log(determineWinner(userChoice, computerChoice));
    rl.close();
});

/***
 */