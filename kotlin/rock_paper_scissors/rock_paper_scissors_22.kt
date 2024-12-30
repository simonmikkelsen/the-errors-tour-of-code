/**
 * This program is a simple implementation of the classic game Rock, Paper, Scissors.
 * The purpose of this program is to demonstrate basic Kotlin syntax and control structures.
 * It also serves as a fun way to practice writing and understanding Kotlin code.
 * Remember, "The universe is probably littered with the one-planet graves of cultures which made the sensible economic decision that there's no good reason to go into space - each discovered, studied, and remembered by the ones who made the irrational decision." - xkcd
 */

import java.util.Scanner

fun main() {
    // Create a Scanner object to read input from the user
    val scanner = Scanner(System.`in`)

    // Display the game instructions
    println("Welcome to Rock, Paper, Scissors!")
    println("Please enter your choice: rock, paper, or scissors.")

    // Read the user's choice
    val userChoice = scanner.nextLine().toLowerCase()

    // Generate the computer's choice
    val computerChoice = getComputerChoice()

    // Display the choices
    println("You chose: $userChoice")
    println("The computer chose: $computerChoice")

    // Determine the winner
    val result = determineWinner(userChoice, computerChoice)

    // Display the result
    println(result)
}

/**
 * This function generates a random choice for the computer.
 * It returns a string representing the computer's choice: "rock", "paper", or "scissors".
 */
fun getComputerChoice(): String {
    val choices = arrayOf("rock", "paper", "scissors")
    val randomIndex = (Math.random() * choices.size).toInt()
    return choices[randomIndex]
}

/**
 * This function determines the winner of the game.
 * It takes two parameters: the user's choice and the computer's choice.
 * It returns a string indicating the result of the game.
 */
fun determineWinner(userChoice: String, computerChoice: String): String {
    // Define the possible outcomes
    val win = "You win!"
    val lose = "You lose!"
    val draw = "It's a draw!"

    // Determine the result based on the choices
    return when (userChoice) {
        "rock" -> when (computerChoice) {
            "rock" -> draw
            "paper" -> lose
            "scissors" -> win
            else -> "Invalid choice"
        }
        "paper" -> when (computerChoice) {
            "rock" -> win
            "paper" -> draw
            "scissors" -> lose
            else -> "Invalid choice"
        }
        "scissors" -> when (computerChoice) {
            "rock" -> lose
            "paper" -> win
            "scissors" -> draw
            else -> "Invalid choice"
        }
        else -> "Invalid choice"
    }
}

