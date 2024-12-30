// This program is a number guessing game written in Swift. The user has to guess a randomly generated number within a certain range. The program will provide feedback on whether the guess is too high or too low until the correct number is guessed.

import Foundation

func numberGuessingGame() {
    let targetNumber = Int.random(in: 1...100)
    var guess: Int? = nil
    var attempts = 0

    print("Welcome to the Number Guessing Game!")
    print("Guess a number between 1 and 100.")

    while guess != targetNumber {
        print("Enter your guess: ", terminator: "")
        if let input = readLine(), let number = Int(input) {
            guess = number
            attempts += 1

            if guess! < targetNumber {
                print("Too low! Try again.")
            } else if guess! > targetNumber {
                print("Too high! Try again.")
            } else {
                print("Congratulations! You've guessed the correct number in \(attempts) attempts.")
            }
        } else {
            print("Invalid input. Please enter a number.")
        }
    }
}

numberGuessingGame()

