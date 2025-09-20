/**
 * This program is a number guessing game implemented in TypeScript.
 * The user has to guess a randomly generated number between 1 and 100.
 * The program will provide feedback whether the guess is too high, too low, or correct.
 */

function getRandomNumber(): number {
    return Math.floor(Math.random() * 100) + 1;
}

function getUserGuess(): number {
    const guess = prompt("Enter your guess (between 1 and 100):");
    return parseInt(guess || "0", 10);
}

function playGame(): void {
    const targetNumber = getRandomNumber();
    let guess = 0;
    let attempts = 0;

    while (guess !== targetNumber) {
        guess = getUserGuess();
        attempts++;

        if (guess < targetNumber) {
            console.log("Too low!");
        } else if (guess > targetNumber) {
            console.log("Too high!");
        } else {
            console.log(`Correct! You guessed the number in ${attempts} attempts.`);
        }
    }
}

playGame();

