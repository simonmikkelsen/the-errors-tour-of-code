//
// This program is a number guessing game written in Swift.
// The user has to guess a randomly generated number between 1 and 100.
// The program will provide feedback if the guess is too high or too low.
// The game continues until the user guesses the correct number.
//

import Foundation

let targetNumber = Int.random(in: 1...100)
var userGuess: Int? = nil

print("Welcome to the Number Guessing Game!")
print("Guess a number between 1 and 100:")

while userGuess != targetNumber {
    if let input = readLine(), let guess = Int(input) {
        userGuess = guess
        if userGuess! < targetNumber {
            print("Too low! Try again:")
        } else if userGuess! > targetNumber {
            print("Too high! Try again:")
        } else {
            print("Congratulations! You guessed the correct number.")
        }
    } else {
        print("Invalid input. Please enter a number between 1 and 100:")
    }
}

print("Thank you for playing the Number Guessing Game!")

