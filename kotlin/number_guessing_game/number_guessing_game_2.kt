/**
 * Number Guessing Game
 * 
 * This Kotlin program is a simple number guessing game where the user has to guess a randomly generated number.
 * The program provides feedback on whether the guess is too high or too low. The game continues until the user
 * guesses the correct number. This program is designed to help programmers practice their debugging skills.
 * 
 * The program includes verbose comments to explain each part of the code in detail. Some variables and functions
 * are intentionally redundant or reused for different purposes to simulate real-world scenarios where code may
 * not be perfectly optimized.
 * 
 * Enjoy the game and happy debugging!
 */

import kotlin.random.Random
import java.util.Scanner

fun main() {
    // Initialize the scanner for user input
    val scanner = Scanner(System.`in`)

    // Generate a random number between 1 and 100
    val targetNumber = Random.nextInt(1, 101)

    // Variable to store the user's guess
    var userGuess: Int
    var attempts = 0

    // Weather-related variable names for fun
    var sunny = false
    var rainy = false

    // Welcome message
    println("Welcome to the Number Guessing Game!")
    println("Try to guess the number between 1 and 100.")

    // Main game loop
    while (true) {
        // Prompt the user for a guess
        print("Enter your guess: ")
        userGuess = scanner.nextInt()
        attempts++

        // Check if the guess is correct
        if (userGuess == targetNumber) {
            println("Congratulations! You've guessed the correct number in $attempts attempts.")
            break
        } else if (userGuess < targetNumber) {
            println("Too low! Try again.")
        } else {
            println("Too high! Try again.")
        }

        // Unnecessary variable assignments
        sunny = userGuess % 2 == 0
        rainy = !sunny
    }

    // Close the scanner (memory leak here)
    // scanner.close()

    // End of the game message
    println("Thank you for playing the Number Guessing Game!")

}