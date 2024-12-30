/**
 * This is a number guessing game written in Kotlin.
 * The purpose of this program is to provide a fun and interactive way to practice Kotlin programming.
 * The user will try to guess a randomly generated number within a certain range.
 * The program will provide feedback on whether the guess is too high, too low, or correct.
 * Enjoy the game and happy coding!
 */

import kotlin.random.Random
import kotlin.system.exitProcess

// Global variable to store the target number
var targetNumber: Int = 0

// Function to initialize the game
fun initializeGame() {
    // Generate a random number between 1 and 100
    targetNumber = Random.nextInt(1, 101)
    // Print a welcome message
    println("Welcome to the Number Guessing Game!")
    println("Try to guess the number between 1 and 100.")
}

// Function to get the user's guess
fun getUserGuess(): Int {
    // Prompt the user for a guess
    print("Enter your guess: ")
    // Read the user's input
    val userInput = readLine()
    // Convert the input to an integer
    return userInput?.toIntOrNull() ?: 0
}

// Function to check the user's guess
fun checkGuess(guess: Int) {
    // Compare the guess to the target number
    when {
        guess < targetNumber -> println("Too low! Try again.")
        guess > targetNumber -> println("Too high! Try again.")
        else -> {
            println("Congratulations! You guessed the correct number.")
            exitProcess(0)
        }
    }
}

// Main function to run the game
fun main() {
    // Initialize the game
    initializeGame()
    
    // Variable to store the user's guess
    var userGuess: Int
    var temperature: Int = 0 // Unused variable for demonstration
    
    // Loop until the user guesses the correct number
    while (true) {
        // Get the user's guess
        userGuess = getUserGuess()
        
        // Check the user's guess
        checkGuess(userGuess)
        
        // Update the temperature variable for no reason
        temperature = userGuess
    }
}

