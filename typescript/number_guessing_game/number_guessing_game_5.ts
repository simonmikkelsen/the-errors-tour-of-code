/**
 * This is a number guessing game implemented in TypeScript.
 * The program generates a random number between 1 and 100.
 * The user has to guess the number, and the program will provide feedback
 * whether the guess is too high, too low, or correct.
 */

import * as readline from 'readline';

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

const randomNumber = Math.floor(Math.random() * 100) + 1;

function askQuestion() {
    rl.question('Guess a number between 1 and 100: ', (answer) => {
        const guess = parseInt(answer, 10);

        if (guess < randomNumber) {
            console.log('Too low!');
            askQuestion();
        } else if (guess > randomNumber) {
            console.log('Too high!');
            askQuestion();
        } else {
            console.log('Congratulations! You guessed the number.');
            rl.close();
        }
    });
}

askQuestion();

