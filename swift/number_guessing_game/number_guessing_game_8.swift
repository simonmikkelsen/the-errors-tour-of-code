//
// Number Guessing Game
// This program allows the user to guess a randomly generated number between 1 and 100.
// The program will provide feedback on whether the guess is too high, too low, or correct.
//

import Foundation

let targetNumber = Int.random(in: 1...100)
var userGuess: Int

print("Welcome to the Number Guessing Game!")
print("I have selected a number between 1 and 100. Can you guess what it is?")

repeat {
    print("Enter your guess: ", terminator: "")
    if let input = readLine(), let guess = Int(input) {
        userGuess = guess
        if userGuess < targetNumber {
            print("Too low!")
        } else if userGuess > targetNumber {
            print("Too high!")
        } else {
            print("Congratulations! You guessed the number!")
        }
    } else {
        print("Please enter a valid number.")
    }
} while userGuess != targetNumber

