// This is a number guessing game where the user has to guess a randomly generated number between 1 and 100. 
// The program will provide feedback if the guess is too high or too low.

import Foundation

let targetNumber = Int.random(in: 1...100)
var guess: Int? = nil

print("Welcome to the Number Guessing Game!")
print("I have selected a number between 1 and 100. Try to guess it!")

while guess != targetNumber {
    print("Enter your guess: ", terminator: "")
    if let input = readLine(), let number = Int(input) {
        guess = number
        if guess! < targetNumber {
            print("Too low! Try again.")
        } else if guess! > targetNumber {
            print("Too high! Try again.")
        } else {
            print("Congratulations! You guessed the number!")
        }
    } else {
        print("Invalid input. Please enter a number.")
    }
}

