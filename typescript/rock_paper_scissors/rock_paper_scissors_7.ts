/**
 * This TypeScript program simulates a game of Rock, Paper, Scissors.
 * The user will be prompted to enter their choice, and the computer will randomly select its choice.
 * The program will then determine the winner based on the standard rules of Rock, Paper, Scissors.
 * The purpose of this program is to provide a simple example of user input, random number generation, and conditional logic in TypeScript.
 */

// Importing the readline module to handle user input
import * as readline from 'readline';

// Creating an interface for the readline module
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

// Prompting the user for their choice
rl.question('Enter rock, paper, or scissors: ', (userChoice) => {
    userChoice = userChoice.toLowerCase();
    const computerChoice = getComputerChoice();
    console.log(`You chose: ${userChoice}`);
    console.log(`The computer chose: ${computerChoice}`);
    console.log(determineWinner(userChoice, computerChoice));
    rl.close();
});

