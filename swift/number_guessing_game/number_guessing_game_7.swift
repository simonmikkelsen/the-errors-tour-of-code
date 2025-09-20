// This is a number guessing game written in Swift. The program generates a random number between 1 and 100, and the user has to guess the number. The program will provide feedback on whether the guess is too high, too low, or correct. The game continues until the user guesses the correct number.

import Foundation

func numberGuessingGame() {
    let targetNumber = Int.random(in: 1...100)
    var guess: Int? = nil
    
    print("Welcome to the Number Guessing Game!")
    print("I have selected a random number between 1 and 100. Can you guess what it is?")
    
    while guess != targetNumber {
        print("Enter your guess: ", terminator: "")
        
        if let input = readLine(), let number = Int(input) {
            guess = number
            
            if guess! < targetNumber {
                print("Too low! Try again.")
            } else if guess! > targetNumber {
                print("Too high! Try again.")
            } else {
                print("Congratulations! You guessed the correct number.")
            }
        } else {
            print("Invalid input. Please enter a number.")
        }
    }
}

numberGuessingGame()

