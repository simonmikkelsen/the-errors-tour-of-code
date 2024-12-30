/**
 * This is a number guessing game implemented in TypeScript.
 * The program generates a random number between 1 and 100.
 * The user has to guess the number, and the program provides feedback.
 */

function getRandomNumber(): number {
    return Math.floor(Math.random() * 100) + 1;
}

function playGame() {
    const randomNumber = getRandomNumber();
    let guess: number;
    let attempts = 0;

    while (guess !== randomNumber) {
        guess = parseInt(prompt("Guess a number between 1 and 100:"));
        attempts++;

        if (guess < randomNumber) {
            console.log("Too low!");
        } else if (guess > randomNumber) {
            console.log("Too high!");
        } else {
            console.log(`Congratulations! You guessed the number in ${attempts} attempts.`);
        }
    }
}

playGame();

