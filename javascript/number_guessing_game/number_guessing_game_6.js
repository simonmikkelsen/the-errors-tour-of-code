// This is a number guessing game. The program will generate a random number between 1 and 100.
// The user will have to guess the number. The program will provide feedback whether the guess
// is too high, too low, or correct. The game continues until the user guesses the correct number.

function getRandomNumber(min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
}

function playGame() {
    const randomNumber = getRandomNumber(1, 100);
    let guess = null;

    while (guess !== randomNumber) {
        guess = parseInt(prompt("Guess a number between 1 and 100:"));

        if (guess > randomNumber) {
            alert("Too high! Try again.");
        } else if (guess < randomNumber) {
            alert("Too low! Try again.");
        } else if (guess === randomNumber) {
            alert("Congratulations! You guessed the correct number.");
        }
    }
}

playGame();

