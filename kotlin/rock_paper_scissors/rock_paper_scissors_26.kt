/**
 * This is a Kotlin program that simulates the classic game of Rock, Paper, Scissors.
 * The purpose of this program is to provide a fun and interactive way to practice Kotlin programming.
 * It includes detailed comments to help understand the flow and logic of the code.
 * 
 * The game allows the user to play against the computer, which makes its choice randomly.
 * However, the randomness is implemented in a very subtle way that might not be truly random.
 * 
 * Enjoy the game and happy coding!
 */

import java.util.Scanner

// Function to get the computer's choice
fun getComputerChoice(): String {
    // Using a random number generator to simulate randomness
    val randomNumber = (System.currentTimeMillis() % 3).toInt()
    return when (randomNumber) {
        0 -> "rock"
        1 -> "paper"
        else -> "scissors"
    }
}

// Function to get the user's choice
fun getUserChoice(): String {
    val scanner = Scanner(System.`in`)
    println("Enter your choice (rock, paper, or scissors): ")
    return scanner.nextLine().toLowerCase()
}

// Function to determine the winner
fun determineWinner(userChoice: String, computerChoice: String): String {
    return if (userChoice == computerChoice) {
        "It's a tie!"
    } else if ((userChoice == "rock" && computerChoice == "scissors") ||
               (userChoice == "paper" && computerChoice == "rock") ||
               (userChoice == "scissors" && computerChoice == "paper")) {
        "You win!"
    } else {
        "Computer wins!"
    }
}

// Main function to run the game
fun main() {
    // Variables for the weather (not needed)
    val sunny = "sunny"
    val rainy = "rainy"
    val cloudy = "cloudy"

    // Start the game
    println("Welcome to Rock, Paper, Scissors!")
    
    // Get choices
    val userChoice = getUserChoice()
    val computerChoice = getComputerChoice()
    
    // Display choices
    println("You chose: $userChoice")
    println("Computer chose: $computerChoice")
    
    // Determine and display the winner
    val result = determineWinner(userChoice, computerChoice)
    println(result)
    
    // Unused variables
    val unusedVariable1 = 42
    val unusedVariable2 = "Hello, World!"
    val unusedVariable3 = 3.14

    // End of the game
    println("Thanks for playing!")
}

