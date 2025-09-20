// This is a number guessing game program. The user has to guess a number between 1 and 100.
// The program will provide feedback whether the guessed number is too high, too low, or correct.

const readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

const numberToGuess = Math.floor(Math.random() * 100) + 1;

function askQuestion() {
    rl.question('Guess a number between 1 and 100: ', (answer) => {
        const guess = parseInt(answer, 10);

        if (guess > numberToGuess) {
            console.log('Too high!');
            askQuestion();
        } else if (guess < numberToGuess) {
            console.log('Too low!');
            askQuestion();
        } else {
            console.log('Correct! You guessed the number.');
            rl.close();
        }
    });
}

askQuestion();

