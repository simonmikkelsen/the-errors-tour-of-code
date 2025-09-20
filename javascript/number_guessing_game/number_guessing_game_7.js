/*
This is a number guessing game. The program will generate a random number between 1 and 100.
The user will have to guess the number. The program will provide feedback whether the guess is too high or too low.
The game continues until the user guesses the correct number.
*/

function numberGuessingGame() {
    const randomNumber = Math.floor(Math.random() * 100) + 1;
    let guess = null;

    while (guess !== randomNumber) {
        guess = parseInt(prompt("Guess a number between 1 and 100: "), 10);

        if (guess > randomNumber) {
            alert("Too high! Try again.");
        } else if (guess < randomNumber) {
            alert("Too low! Try again.");
        } else {
            alert("Congratulations! You guessed the correct number.");
        }
    }
}

numberGuessingGame();

