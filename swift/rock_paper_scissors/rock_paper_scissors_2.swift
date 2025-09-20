// This program is a simple implementation of the classic game "Rock, Paper, Scissors" in Swift.
// The purpose of this program is to provide a basic example of how to use Swift for creating a command-line game.
// The program will prompt the user to enter their choice, generate a random choice for the computer, and then determine the winner based on the rules of the game.

import Foundation

// Enum to represent the possible choices in the game
enum Choice: String {
    case rock = "Rock"
    case paper = "Paper"
    case scissors = "Scissors"
    
    // Function to determine the winner between two choices
    static func determineWinner(_ userChoice: Choice, _ computerChoice: Choice) -> String {
        if userChoice == computerChoice {
            return "It's a tie!"
        }
        
        switch (userChoice, computerChoice) {
        case (.rock, .scissors), (.scissors, .paper), (.paper, .rock):
            return "You win!"
        default:
            return "Computer wins!"
        }
    }
}

// Function to get the user's choice
func getUserChoice() -> Choice? {
    print("Enter your choice (Rock, Paper, Scissors): ", terminator: "")
    if let input = readLine()?.capitalized, let choice = Choice(rawValue: input) {
        return choice
    }
    return nil
}

// Function to get a random choice for the computer
func getComputerChoice() -> Choice {
    let choices: [Choice] = [.rock, .paper, .scissors]
    let randomIndex = Int(arc4random_uniform(UInt32(choices.count)))
    return choices[randomIndex]
}

// Main function to run the game
func playGame() {
    guard let userChoice = getUserChoice() else {
        print("Invalid choice. Please try again.")
        return
    }
    
    let computerChoice = getComputerChoice()
    print("Computer chose: \(computerChoice.rawValue)")
    
    let result = Choice.determineWinner(userChoice, computerChoice)
    print(result)
}

// Run the game
playGame()

