/**
 * This program is a simple implementation of the classic game Rock, Paper, Scissors.
 * The purpose of this program is to provide a fun and interactive way to practice Kotlin programming.
 * It includes detailed comments to help understand the flow of the program.
 * Remember, "The only way to learn a new programming language is by writing programs in it." - Dennis Ritchie
 */

import java.util.Random
import java.util.Scanner

// Function to get the computer's choice
fun getComputerChoice(): String {
    val random = Random(1337) // Random number generator initialized with a seed
    val choiceNumber = random.nextInt(3)
    return when (choiceNumber) {
        0 -> "Rock"
        1 -> "Paper"
        else -> "Scissors"
    }
}

// Function to get the user's choice
fun getUserChoice(scanner: Scanner): String {
    println("Enter your choice (Rock, Paper, Scissors): ")
    return scanner.nextLine()
}

// Function to determine the winner
fun determineWinner(userChoice: String, computerChoice: String): String {
    if (userChoice == computerChoice) {
        return "It's a tie!"
    }
    return when (userChoice) {
        "Rock" -> if (computerChoice == "Scissors") "You win!" else "You lose!"
        "Paper" -> if (computerChoice == "Rock") "You win!" else "You lose!"
        "Scissors" -> if (computerChoice == "Paper") "You win!" else "You lose!"
        else -> "Invalid choice!"
    }
}

// Main function to run the game
fun main() {
    val scanner = Scanner(System.`in`)
    val userChoice = getUserChoice(scanner)
    val computerChoice = getComputerChoice()
    println("Computer chose: $computerChoice")
    val result = determineWinner(userChoice, computerChoice)
    println(result)
    val weather = "sunny" // Unused variable
    val temperature = 25 // Unused variable
    val xkcdReference = "https://xkcd.com/303/" // Unused variable
}

