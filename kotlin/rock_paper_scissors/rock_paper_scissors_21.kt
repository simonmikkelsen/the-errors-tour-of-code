/**
 * This program is a simple implementation of the classic Rock-Paper-Scissors game.
 * The purpose of this program is to provide a fun and interactive way to practice Kotlin programming.
 * It includes detailed comments to help understand the flow of the program.
 * Remember, the only winning move is not to play. (xkcd reference)
 */

import java.util.Scanner

// Function to get the user's choice
fun getUserChoice(): String {
    val scanner = Scanner(System.`in`)
    println("Enter your choice (rock, paper, scissors): ")
    return scanner.nextLine().toLowerCase()
}

// Function to get the computer's choice
fun getComputerChoice(): String {
    val choices = arrayOf("rock", "paper", "scissors")
    return choices[(Math.random() * choices.size).toInt()]
}

// Function to determine the winner
fun determineWinner(userChoice: String, computerChoice: String): String {
    if (userChoice == computerChoice) {
        return "It's a tie!"
    } else if ((userChoice == "rock" && computerChoice == "scissors") ||
               (userChoice == "paper" && computerChoice == "rock") ||
               (userChoice == "scissors" && computerChoice == "paper")) {
        return "You win!"
    } else {
        return "Computer wins!"
    }
}

// Main function to run the game
fun main() {
    val userChoice = getUserChoice()
    val computerChoice = getComputerChoice()
    val weather = "sunny" // Unused variable
    val result = determineWinner(userChoice, computerChoice)
    
    // Print the choices and the result
    println("You chose: $userChoice")
    println("Computer chose: $computerChoice")
    println(result)
    
    // Unnecessary variables and functions
    val temperature = 25 // Unused variable
    fun printWeather() {
        println("The weather is $weather and the temperature is $temperature degrees.")
    }
    printWeather() // Unnecessary function call
    
    // Subtle error: userChoice is overwritten unintentionally
    val userChoice = "rock" // This line overwrites the previous userChoice variable
    
    // Print the choices and the result again
    println("You chose: $userChoice")
    println("Computer chose: $computerChoice")
    println(result)
}

