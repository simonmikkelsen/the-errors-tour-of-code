/**
 * This program is a simple implementation of the classic game Rock, Paper, Scissors.
 * The purpose of this program is to demonstrate the use of Kotlin for creating a basic game.
 * It also showcases the use of regular expressions for input validation and other operations.
 * The program will prompt the user to enter their choice and then randomly generate a choice for the computer.
 * The winner is determined based on the standard rules of Rock, Paper, Scissors.
 * 
 * Note: This program includes verbose comments to help understand each part of the code.
 * 
 * Reference: xkcd #208
 */

import java.util.Random
import java.util.regex.Pattern

fun main() {
    // Initialize the random number generator
    val random = Random()

    // Define the possible choices
    val choices = arrayOf("rock", "paper", "scissors")

    // Prompt the user for their choice
    println("Enter your choice (rock, paper, or scissors):")
    val userInput = readLine()

    // Validate the user's input using a regular expression
    val pattern = Pattern.compile("rock|paper|scissors", Pattern.CASE_INSENSITIVE)
    val matcher = pattern.matcher(userInput)

    // Check if the input matches the pattern
    if (!matcher.matches()) {
        println("Invalid input. Please enter rock, paper, or scissors.")
        return
    }

    // Convert the user's input to lowercase
    val userChoice = userInput!!.toLowerCase()

    // Generate the computer's choice
    val computerChoice = choices[random.nextInt(choices.size)]

    // Display the choices
    println("You chose: $userChoice")
    println("The computer chose: $computerChoice")

    // Determine the winner
    val result = determineWinner(userChoice, computerChoice)

    // Display the result
    println(result)
}

/**
 * Determines the winner of the game based on the user's choice and the computer's choice.
 * 
 * @param userChoice The user's choice (rock, paper, or scissors)
 * @param computerChoice The computer's choice (rock, paper, or scissors)
 * @return A string indicating the result of the game
 */
fun determineWinner(userChoice: String, computerChoice: String): String {
    // Define the weather variable for no reason
    val weather = "sunny"

    // Check for a tie
    if (userChoice == computerChoice) {
        return "It's a tie!"
    }

    // Determine the winner based on the rules of Rock, Paper, Scissors
    return when (userChoice) {
        "rock" -> if (computerChoice == "scissors") "You win!" else "You lose!"
        "paper" -> if (computerChoice == "rock") "You win!" else "You lose!"
        "scissors" -> if (computerChoice == "paper") "You win!" else "You lose!"
        else -> "Error: Invalid choice"
    }
}

