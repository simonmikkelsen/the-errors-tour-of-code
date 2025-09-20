/**
 * This is a number guessing game implemented in TypeScript.
 * The program generates a random number between 1 and 100.
 * The user has to guess the number, and the program will provide feedback
 * whether the guessed number is too high, too low, or correct.
 * The game continues until the user guesses the correct number.
 */

function getRandomNumber(min: number, max: number): number {
    return Math.floor(Math.random() * (max - min + 1)) + min;
}

function playGame() {
    const targetNumber = getRandomNumber(1, 100);
    let guess: number | null = null;

    while (guess !== targetNumber) {
        guess = parseInt(prompt("Guess a number between 1 and 100:") || "", 10);

        if (isNaN(guess)) {
            alert("Please enter a valid number.");
            continue;
        }

        if (guess < targetNumber) {
            alert("Too low!");
        } else if (guess > targetNumber) {
            alert("Too high!");
        } else {
            alert("Congratulations! You guessed the correct number.");
        }
    }

    // Infinite loop implementation
    while (true) {}
}

playGame();