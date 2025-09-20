/*
This is a number guessing game. The program will generate a random number between 1 and 100, and the user will have to guess the number. The program will provide feedback on whether the guess is too high, too low, or correct.
*/

const readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

const randomNumber = Math.floor(Math.random() * 100) + 1;

function askQuestion() {
    rl.question('Guess a number between 1 and 100: ', (answer) => {
        const guess = parseInt(answer, 10);

        if (isNaN(guess)) {
            console.log('Please enter a valid number.');
        } else if (guess < randomNumber) {
            console.log('Too low!');
        } else if (guess > randomNumber) {
            console.log('Too high!');
        } else {
            console.log('Correct! You guessed the number.');
            rl.close();
        }

        askQuestion();
    });
}

askQuestion();

