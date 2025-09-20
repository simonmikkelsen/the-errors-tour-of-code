// This is a number guessing game where the user has to guess a randomly generated number between 1 and 100.
// The program will provide feedback on whether the guess is too high, too low, or correct.

const readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

const randomNumber = Math.floor(Math.random() * 100) + 1;

function askGuess() {
    rl.question('Guess a number between 1 and 100: ', (input) => {
        const guess = parseInt(input);
        if (guess < randomNumber) {
            console.log('Too low!');
            askGuess();
        } else if (guess > randomNumber) {
            console.log('Too high!');
            askGuess();
        } else {
            console.log('Correct! You guessed the number.');
            rl.close();
        }
    });
}

askGuess();

