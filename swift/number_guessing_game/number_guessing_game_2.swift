//
// This is a number guessing game written in Swift.
// The purpose of this program is to allow the user to guess a randomly generated number between 1 and 100.
// The program will provide feedback on whether the guess is too high, too low, or correct.
//

import Foundation

class NumberGuessingGame {
    var targetNumber: Int
    var attempts: Int
    var previousGuesses: [Int]?

    init() {
        self.targetNumber = Int(arc4random_uniform(100)) + 1
        self.attempts = 0
        self.previousGuesses = []
    }

    func startGame() {
        print("Welcome to the Number Guessing Game!")
        print("I have selected a number between 1 and 100. Can you guess it?")

        while true {
            print("Enter your guess: ", terminator: "")
            if let input = readLine(), let guess = Int(input) {
                attempts += 1
                previousGuesses?.append(guess)

                if guess < targetNumber {
                    print("Too low! Try again.")
                } else if guess > targetNumber {
                    print("Too high! Try again.")
                } else {
                    print("Congratulations! You've guessed the number in \(attempts) attempts.")
                    break
                }
            } else {
                print("Invalid input. Please enter a number.")
            }
        }
    }
}

let game = NumberGuessingGame()
game.startGame()

