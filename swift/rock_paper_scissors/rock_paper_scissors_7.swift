// This Swift program is a simple implementation of the classic game "Rock, Paper, Scissors".
// The purpose of this program is to help programmers understand the basic structure of a Swift program,
// including the use of functions, conditionals, and user input. The program will prompt the user to enter
// their choice of rock, paper, or scissors, and then randomly generate a choice for the computer. The program
// will then determine the winner based on the rules of the game and display the result to the user.

import Foundation

// Function to get the user's choice
func getUserChoice() -> String {
    print("Enter your choice (rock, paper, or scissors): ", terminator: "")
    if let choice = readLine() {
        return choice.lowercased()
    }
    return "invalid"
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
let computerChoice = getComputerChoice()

print("You chose: \(userChoice)")
print("Computer chose: \(computerChoice)")

let result = determineWinner(userChoice: userChoice, computerChoice: computerChoice)
print(result)

