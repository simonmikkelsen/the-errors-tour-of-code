/**
 * This is a number guessing game implemented in TypeScript.
 * The program generates a random number between 1 and 100.
 * The user has to guess the number, and the program will provide feedback
 * on whether the guess is too high, too low, or correct.
 */

import * as readline from 'readline';

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

const randomNumber = Math.floor(Math.random() * 100) + 1;

function askQuestion() {
    rl.question('Guess the number (between 1 and 100): ', (answer) => {
        const userGuess = parseInt(answer);
        if (userGuess === randomNumber) {
            console.log('Congratulations! You guessed the correct number.');
            rl.close();
        } else if (userGuess < randomNumber) {
            console.log('Too low. Try again.');
            askQuestion();
        } else {
            console.log('Too high. Try again.');
            askQuestion();
        }
    });
}

askQuestion();

