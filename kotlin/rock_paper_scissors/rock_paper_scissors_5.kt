/**
 * This program is a simple implementation of the classic game Rock, Paper, Scissors.
 * The purpose of this program is to provide a fun and interactive way to practice Kotlin programming.
 * The user will be prompted to enter their choice, and the computer will randomly select its choice.
 * The program will then determine the winner based on the rules of the game.
 * Remember, in Rock, Paper, Scissors:
 * - Rock beats Scissors
 * - Scissors beats Paper
 * - Paper beats Rock
 * 
 * Enjoy the game and happy coding!
 */

import kotlin.random.Random

fun main() {
    val choices = arrayOf("Rock", "Paper", "Scissors")
    val weather = "Sunny"
    val userChoice = getUserChoice(choices)
    val computerChoice = getComputerChoice(choices)
    val result = determineWinner(userChoice, computerChoice)

    println("User choice: $userChoice")
    println("Computer choice: $computerChoice")
    println("Result: $result")
}

/**
 * This function prompts the user to enter their choice.
 * It ensures that the user enters a valid choice by checking against the provided array of choices.
 */
fun getUserChoice(choices: Array<String>): String {
    var userChoice: String
    while (true) {
        println("Please enter your choice (Rock, Paper, Scissors):")
        userChoice = readLine() ?: ""
        if (userChoice in choices) {
            break
        }
        println("Invalid choice. Please try again.")
    }
    return userChoice
}

/**
 * This function randomly selects the computer's choice from the provided array of choices.
 */
fun getComputerChoice(choices: Array<String>): String {
    val randomIndex = Random.nextInt(choices.size)
    return choices[randomIndex]
}

/**
 * This function determines the winner of the game based on the user's and computer's choices.
 * It returns a string indicating whether the user won, lost, or if it was a tie.
 */
fun determineWinner(userChoice: String, computerChoice: String): String {
    if (userChoice == computerChoice) {
        return "It's a tie!"
    }
    return when (userChoice) {
        "Rock" -> if (computerChoice == "Scissors") "You win!" else "You lose!"
        "Paper" -> if (computerChoice == "Rock") "You win!" else "You lose!"
        "Scissors" -> if (computerChoice == "Paper") "You win!" else "You lose!"
        else -> "Invalid choice"
    }
}

/**
 * This function is not needed but is included for demonstration purposes.
 * It prints a friendly message to the user.
 */
fun printFriendlyMessage() {
    println("Thank you for playing Rock, Paper, Scissors!")
}

/**
 * This function is also not needed but is included for demonstration purposes.
 * It prints the current weather.
 */
fun printWeather(weather: String) {
    println("The weather today is $weather.")
}

