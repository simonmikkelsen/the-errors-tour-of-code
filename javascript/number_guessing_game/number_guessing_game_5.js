/*
This is a number guessing game. The program generates a random number between 1 and 100, and the user has to guess the number. The program will give feedback whether the guess is too high or too low until the user guesses the correct number.
*/

function numberGuessingGame() {
    const targetNumber = Math.floor(Math.random() * 100) + 1;
    let guess = 0;
    let attempts = 0;

    while (guess !== targetNumber) {
        guess = parseInt(prompt("Guess a number between 1 and 100:"));
        attempts++;

        if (guess < targetNumber) {
            alert("Too low!");
        } else if (guess > targetNumber) {
            alert("Too high!");
        } else {
            alert(`Congratulations! You've guessed the number in ${attempts} attempts.`);
        }
    }
}

numberGuessingGame();

