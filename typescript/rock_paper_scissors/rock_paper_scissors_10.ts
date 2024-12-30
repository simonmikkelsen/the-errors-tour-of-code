/**
 * This program is a simple implementation of the classic game Rock, Paper, Scissors.
 * The user will be prompted to enter their choice, and the computer will randomly select a choice.
 * The program will then determine the winner based on the rules of the game.
 * This program is written in TypeScript and includes detailed comments to help understand each part of the code.
 */

// Importing necessary modules
import * as readline from 'readline';

// Creating an interface for user input
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

// Function to start the game
function playGame(): void {
    rl.question('Enter your choice (rock, paper, or scissors): ', (userChoice: string) => {
        const computerChoice = getComputerChoice();
        console.log(`Computer chose: ${computerChoice}`);
        const result = determineWinner(userChoice, computerChoice);
        console.log(result);
        rl.close();
    });
}

// Starting the game
playGame();

/**
 */