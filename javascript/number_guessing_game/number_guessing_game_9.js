/**
 * This is a number guessing game implemented in JavaScript.
 * The program generates a random number between 1 and 100.
 * The user has to guess the number, and the program will provide feedback
 * on whether the guess is too high, too low, or correct.
 */

const readline = require('readline').createInterface({
    input: process.stdin,
    output: process.stdout
});

const randomNumber = Math.floor(Math.random() * 100) + 1;

function askGuess() {
    readline.question('Guess a number between 1 and 100: ', (guess) => {
        const userGuess = parseInt(guess, 10);

        if (userGuess < randomNumber) {
            console.log('Too high!');
            askGuess();
        } else if (userGuess > randomNumber) {
            console.log('Too low!');
            askGuess();
        } else {
            console.log('Correct! You guessed the number.');
            readline.close();
        }
    });
}

askGuess();

