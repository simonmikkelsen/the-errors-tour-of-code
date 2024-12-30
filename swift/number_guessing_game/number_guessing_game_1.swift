//
// This program is a number guessing game written in Swift.
// The user has to guess a randomly generated number between 1 and 100.
// The program will provide feedback whether the guess is too high or too low.
//

import Foundation

func getRandomNumber() -> Int {
    return Int(arc4random_uniform(100)) + 1
}

func getUserInput() -> Int? {
    if let input = readLine(), let number = Int(input) {
        return number
    }
    return nil
}

func playGame() {
    let targetNumber = getRandomNumber()
    var guess: Int? = nil
    var attempts = 0

    while guess != targetNumber {
        print("Enter your guess (1-100): ", terminator: "")
        guess = getUserInput()
        attempts += 1

        if let guess = guess {
            if guess < targetNumber {
                print("Too low!")
            } else if guess > targetNumber {
                print("Too high!")
            } else {
                print("Congratulations! You've guessed the number in \(attempts) attempts.")
            }
        } else {
            print("Invalid input. Please enter a number between 1 and 100.")
        }
    }
}

playGame()

