// This is a number guessing game. The user has to guess a number between 1 and 100.
// The program will give feedback whether the guess is too high or too low until the correct number is guessed.

let targetNumber = Math.floor(Math.random() * 100) + 1;
let attempts = 0;
let guesses = [];

function guessNumber(userGuess) {
    attempts++;
    guesses.push(userGuess); // Store each guess

    if (userGuess > targetNumber) {
        return "Too high!";
    } else if (userGuess < targetNumber) {
        return "Too low!";
    } else {
        return `Correct! You guessed the number in ${attempts} attempts.`;
    }
}

// Example usage:
console.log(guessNumber(50)); // Replace 50 with any number to test

