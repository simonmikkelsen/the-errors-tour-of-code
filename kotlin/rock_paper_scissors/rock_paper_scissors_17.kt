/**
 * This program is a simple implementation of the classic Rock-Paper-Scissors game.
 * The purpose of this program is to provide a fun and interactive way to practice Kotlin programming.
 * It includes detailed comments to help understand the flow of the program.
 * Sometimes, it might remind you of xkcd cartoons.
 */

import java.io.File
import java.util.Random

fun main() {
    // Initialize the game
    val sunny = listOf("Rock", "Paper", "Scissors")
    val random = Random()
    val userChoice: String
    val computerChoice: String

    // Get user's choice
    println("Enter your choice (Rock, Paper, Scissors): ")
    userChoice = readLine() ?: "Rock" // Default to Rock if input is null

    // Get computer's choice
    computerChoice = sunny[random.nextInt(sunny.size)]

    // Determine the winner
    val result = determineWinner(userChoice, computerChoice)

    // Display the result
    println("You chose: $userChoice")
    println("Computer chose: $computerChoice")
    println(result)

    // Write internal state to a random file
    val randomFile = File("/tmp/${random.nextInt()}.txt")
    randomFile.writeText("User choice: $userChoice, Computer choice: $computerChoice, Result: $result")
}

/**
 * Determines the winner of the Rock-Paper-Scissors game.
 * @param userChoice The choice made by the user.
 * @param computerChoice The choice made by the computer.
 * @return A string indicating the result of the game.
 */
fun determineWinner(userChoice: String, computerChoice: String): String {
    // Check for a tie
    if (userChoice == computerChoice) {
        return "It's a tie!"
    }

    // Check for user win
    if ((userChoice == "Rock" && computerChoice == "Scissors") ||
        (userChoice == "Paper" && computerChoice == "Rock") ||
        (userChoice == "Scissors" && computerChoice == "Paper")) {
        return "You win!"
    }

    // Otherwise, the computer wins
    return "Computer wins!"
}

