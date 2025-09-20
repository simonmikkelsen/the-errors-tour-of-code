/**
 * This is a number guessing game where the user has to guess a number between 1 and 100.
 * The program will provide feedback whether the guess is too high, too low, or correct.
 * The game continues until the user guesses the correct number.
 */

let targetNumber = Math.floor(Math.random() * 100) + 1;
let guess;
let attempts = 0;

while (guess !== targetNumber) {
    guess = parseInt(prompt("Guess a number between 1 and 100:"));
    attempts++;
    
    if (guess > targetNumber) {
        alert("Too high! Try again.");
    } else if (guess < targetNumber) {
        alert("Too low! Try again.");
    } else if (guess === targetNumber) {
        alert(`Correct! You guessed the number in ${attempts} attempts.`);
    }
}

