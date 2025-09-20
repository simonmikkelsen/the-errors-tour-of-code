//
// This is a number guessing game written in Swift. The program generates a random number between 1 and 100, 
// and the user has to guess the number. The program will provide feedback if the guess is too high or too low.
//

import Foundation

let targetNumber = Int.random(in: 1...100)
var userGuess: Int? = nil

print("Welcome to the Number Guessing Game!")
print("I have selected a random number between 1 and 100. Try to guess it!")

while userGuess != targetNumber {
    print("Enter your guess: ", terminator: "")
    if let input = readLine(), let guess = Int(input) {
        userGuess = guess
        if userGuess! < targetNumber {
            print("Too low! Try again.")
        } else if userGuess! > targetNumber {
            print("Too high! Try again.")
        } else {
            print("Congratulations! You guessed the number!")
        }
    } else {
        print("Invalid input. Please enter a number.")
    }
}

