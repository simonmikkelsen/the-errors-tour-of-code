/*
This is a number guessing game. The program generates a random number between 1 and 100, and the user has to guess the number. The program will give feedback if the guess is too high or too low until the user guesses the correct number.
*/

const readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

const numberToGuess = Math.floor(Math.random() * 100) + 1;

function askQuestion() {
    rl.question('Guess a number between 1 and 100: ', (answer) => {
        const guess = parseInt(answer);

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

