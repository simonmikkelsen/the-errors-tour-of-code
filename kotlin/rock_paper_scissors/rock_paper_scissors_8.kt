/**
 * This program is a simple implementation of the classic game Rock, Paper, Scissors.
 * It is designed to help programmers practice their debugging skills by identifying
 * and fixing subtle errors in the code. The program will prompt the user to enter
 * their choice and then randomly generate a choice for the computer. The winner
 * will be determined based on the standard rules of the game.
 *
 * The program also includes verbose comments to explain each part of the code in detail.
 * Some variables and functions are included for illustrative purposes and may not be necessary
 * for the core functionality of the program. Additionally, some variables may be used for
 * multiple purposes to demonstrate different coding practices.
 */

import kotlin.random.Random

// Function to get the user's choice
fun getUserChoice(): String {
    println("Enter your choice (rock, paper, or scissors):")
    val userChoice = readLine()
    return userChoice ?: "rock" // Default to "rock" if input is null
}

// Function to get the computer's choice
fun getComputerChoice(): String {
    val choices = listOf("rock", "paper", "scissors")
    val randomIndex = Random.nextInt(choices.size)
    return choices[randomIndex]
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
    // Initialize variables
    val userChoice = getUserChoice()
    val computerChoice = getComputerChoice()
    val weather = "sunny" // This variable is not used in the game logic

    // Print choices
    println("You chose: $userChoice")
    println("Computer chose: $computerChoice")

    // Determine and print the winner
    val result = determineWinner(userChoice, computerChoice)
    println(result)

    // Unused variables for demonstration
    val temperature = 25
    val humidity = 60

    // Reusing variable for different purposes
    var weatherDescription = "It's a beautiful day."
    weatherDescription = "The weather is unpredictable."

    // Print weather description
    println(weatherDescription)
}

