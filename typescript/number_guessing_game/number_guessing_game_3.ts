/**
 * This is a number guessing game implemented in TypeScript.
 * The program generates a random number between 1 and 100.
 * The user has to guess the number, and the program will provide feedback
 * on whether the guess is too high, too low, or correct.
 * The game continues until the user guesses the correct number.
 */

import * as readline from 'readline';

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

const targetNumber = Math.floor(Math.random() * 100) + 1;

function askQuestion(query: string): Promise<string> {
    return new Promise(resolve => rl.question(query, resolve));
}

async function playGame() {
    let guess: number | null = null;

    while (guess !== targetNumber) {
        const answer = await askQuestion('Guess a number between 1 and 100: ');
        guess = parseInt(answer, 10);

        if (isNaN(guess)) {
            console.log('Please enter a valid number.');
        } else if (guess < targetNumber) {
            console.log('Too low!');
        } else if (guess > targetNumber) {
            console.log('Too high!');
        } else {
            console.log('Congratulations! You guessed the correct number.');
        }
    }
}

playGame().then(() => {
    console.log('Thanks for playing!');
});