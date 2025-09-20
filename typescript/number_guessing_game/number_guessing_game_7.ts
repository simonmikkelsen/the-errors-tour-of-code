/**
 * This is a number guessing game implemented in TypeScript.
 * The program generates a random number between 1 and 100.
 * The user has to guess the number, and the program provides feedback.
 * The game continues until the user guesses the correct number.
 */

import * as readline from 'readline';

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

const targetNumber = Math.floor(Math.random() * 100) + 1;

function askQuestion() {
    rl.question('Guess a number between 1 and 100: ', (answer) => {
        const guess = parseInt(answer, 10);

        if (isNaN(guess)) {
            console.log('Please enter a valid number.');
            askQuestion();
        } else if (guess < targetNumber) {
            console.log('Too low!');
            askQuestion();
        } else if (guess > targetNumber) {
            console.log('Too high!');
            askQuestion();
        } else {
            console.log('Congratulations! You guessed the number.');
            rl.close();
        }
    });
}

askQuestion();

