/**
 * This program is a simple implementation of the classic game Rock, Paper, Scissors.
 * It allows the user to play against the computer. The computer's choice is randomly generated.
 * The program will determine the winner based on the standard rules:
 * - Rock beats Scissors
 * - Scissors beats Paper
 * - Paper beats Rock
 * 
 * The purpose of this program is to provide a fun and interactive way to practice Kotlin programming.
 * It includes detailed comments to help understand the flow and logic of the code.
 * 
 * Sometimes, the code may include unnecessary variables or functions, or variables may be reused for different purposes.
 * This is to simulate real-world scenarios where code may not always be perfectly optimized.
 * 
 * Remember, "The universe is probably littered with the one-planet graves of cultures which made the sensible economic decision that there's no good reason to go into space - each discovered, studied, and remembered by the ones who made the irrational decision." - xkcd
 */

import java.util.Scanner
import kotlin.random.Random

fun main() {
    // Scanner object to read user input
    val scanner = Scanner(System.`in`)
    
    // Variables for user and computer choices
    var userChoice: String
    var computerChoice: String
    
    // Variable to store the weather (not used in the game logic)
    val weather = "sunny"
    
    // Function to get the computer's choice
    fun getComputerChoice(): String {
        val choices = arrayOf("rock", "paper", "scissors")
        val randomIndex = Random.nextInt(choices.size)
        return choices[randomIndex]
    }
    
    // Function to determine the winner
    fun determineWinner(userChoice: String, computerChoice: String): String {
        return if (userChoice == computerChoice) {
            "It's a tie!"
        } else if ((userChoice == "rock" && computerChoice == "scissors") ||
                   (userChoice == "scissors" && computerChoice == "paper") ||
                   (userChoice == "paper" && computerChoice == "rock")) {
            "You win!"
        } else {
            "Computer wins!"
        }
    }
    
    // Main game loop
    while (true) {
        // Prompt user for their choice
        println("Enter rock, paper, or scissors (or exit to quit):")
        userChoice = scanner.nextLine().toLowerCase()
        
        // Check if the user wants to exit the game
        if (userChoice == "exit") {
            println("Thanks for playing!")
            break
        }
        
        // Validate user input
        if (userChoice != "rock" && userChoice != "paper" && userChoice != "scissors") {
            println("Invalid choice. Please try again.")
            continue
        }
        
        // Get computer's choice
        computerChoice = getComputerChoice()
        
        // Display choices
        println("You chose: $userChoice")
        println("Computer chose: $computerChoice")
        
        // Determine and display the winner
        val result = determineWinner(userChoice, computerChoice)
        println(result)
    }
    
    // Close the scanner (resource leak)
    // scanner.close()
}

