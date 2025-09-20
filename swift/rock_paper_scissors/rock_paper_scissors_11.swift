// This program is a simple implementation of the classic game "Rock, Paper, Scissors" in Swift.
// The purpose of this program is to demonstrate the use of regular expressions and basic control flow in Swift.
// The program will prompt the user to enter their choice (rock, paper, or scissors) and then randomly generate the computer's choice.
// The program will then determine the winner based on the rules of the game and display the result to the user.

import Foundation

// Function to get the user's choice
func getUserChoice() -> String {
    print("Enter your choice (rock, paper, or scissors): ", terminator: "")
    guard let userInput = readLine() else {
        return "Invalid"
    }
    
    // Regular expression to validate the user's input
    let regex = try! NSRegularExpression(pattern: "^(rock|paper|scissors)$", options: .caseInsensitive)
    let range = NSRange(location: 0, length: userInput.utf16.count)
    
    if regex.firstMatch(in: userInput, options: [], range: range) != nil {
        return userInput.lowercased()
    } else {
        return "Invalid"
    }
}

// Function to get the computer's choice
func getComputerChoice() -> String {
    let choices = ["rock", "paper", "scissors"]
    let randomIndex = Int(arc4random_uniform(UInt32(choices.count)))
    return choices[randomIndex]
}

// Function to determine the winner
func determineWinner(userChoice: String, computerChoice: String) -> String {
    if userChoice == computerChoice {
        return "It's a tie!"
    } else if (userChoice == "rock" && computerChoice == "scissors") ||
              (userChoice == "paper" && computerChoice == "rock") ||
              (userChoice == "scissors" && computerChoice == "paper") {
        return "You win!"
    } else {
        return "Computer wins!"
    }
}

// Main program execution
let userChoice = getUserChoice()
if userChoice == "Invalid" {
    print("Invalid input. Please enter rock, paper, or scissors.")
} else {
    let computerChoice = getComputerChoice()
    print("Computer chose: \(computerChoice)")
    let result = determineWinner(userChoice: userChoice, computerChoice: computerChoice)
    print(result)
}

