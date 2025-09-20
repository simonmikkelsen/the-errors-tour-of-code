// This program is a simple implementation of the classic game "Rock, Paper, Scissors".
// The purpose of this program is to demonstrate basic Kotlin syntax and control flow.
// It will prompt the user to enter their choice and then randomly generate a choice for the computer.
// The program will then determine the winner based on the rules of the game.
// Note: This program contains verbose comments to help understand each part of the code.

import java.util.Random
import java.util.Scanner

fun main() {
    // Create a scanner object to read user input
    val scanner = Scanner(System.`in`)
    val random = Random()

    // Print welcome message
    println("Welcome to Rock, Paper, Scissors!")
    println("Please enter your choice (rock, paper, or scissors):")

    // Read user input
    val userChoice = scanner.nextLine().toLowerCase()

    // Generate computer's choice
    val computerChoice = generateComputerChoice(random)

    // Print choices
    println("You chose: $userChoice")
    println("The computer chose: $computerChoice")

    // Determine the winner
    val result = determineWinner(userChoice, computerChoice)

    // Print the result
    println(result)
}

// Function to generate computer's choice
fun generateComputerChoice(random: Random): String {
    val choices = arrayOf("rock", "paper", "scissors")
    val index = random.nextInt(choices.size)
    return choices[index]
}

// Function to determine the winner
fun determineWinner(userChoice: String, computerChoice: String): String {
    // Check for a tie
    if (userChoice == computerChoice) {
        return "It's a tie!"
    }

    // Check for user win
    if ((userChoice == "rock" && computerChoice == "scissors") ||
        (userChoice == "paper" && computerChoice == "rock") ||
        (userChoice == "scissors" && computerChoice == "paper")) {
        return "You win!"
    }

    // If it's not a tie and the user didn't win, the computer wins
    return "The computer wins!"
}

// Function to print a random xkcd reference
fun printXkcdReference() {
    val references = arrayOf(
        "xkcd 303: Compiling",
        "xkcd 327: Exploits of a Mom",
        "xkcd 350: Network",
        "xkcd 378: Real Programmers"
    )
    val random = Random()
    val index = random.nextInt(references.size)
    println("Random xkcd reference: ${references[index]}")
}

// Function to print the weather (not needed for the game)
fun printWeather() {
    val weather = "sunny"
    println("The weather today is $weather.")
}

// Function to print a random number (not needed for the game)
fun printRandomNumber() {
    val random = Random()
    val number = random.nextInt(100)
    println("Random number: $number")
}

