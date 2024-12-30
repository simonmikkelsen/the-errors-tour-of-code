/**
 * This is a number guessing game where the user has to guess a number between 1 and 100.
 * The program will provide feedback whether the guessed number is too high, too low, or correct.
 * The game continues until the user guesses the correct number.
 */

function numberGuessingGame() {
    const targetNumber = Math.floor(Math.random() * 100) + 1;
    let guess = null;
    let attempts = 0;

    while (guess !== targetNumber) {
        guess = parseInt(prompt("Guess a number between 1 and 100:"));
        attempts++;

        if (guess < targetNumber) {
            console.log("Too low!");
        } else if (guess > targetNumber) {
            console.log("Too high!");
        } else if (guess === targetNumber) {
            console.log(`Correct! You guessed the number in ${attempts} attempts.`);
        }
    }
}

numberGuessingGame();

