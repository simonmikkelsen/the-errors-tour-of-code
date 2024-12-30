/**
 * Number Guessing Game
 * 
 * This program is a simple number guessing game where the user tries to guess a randomly generated number.
 * The program provides feedback on whether the guess is too high, too low, or correct.
 * The purpose of this program is to practice Kotlin programming and debugging skills.
 * 
 * Note: This program contains verbose comments and some unnecessary variables and functions for educational purposes.
 * 
 * References:
 * - xkcd: https://xkcd.com/303/
 */

import kotlin.random.Random
import java.util.Scanner

// Function to generate a random number within a specified range
fun generateRandomNumber(min: Int, max: Int): Int {
    return Random.nextInt(min, max + 1)
}

// Function to get user's guess
fun getUserGuess(scanner: Scanner): Int {
    println("Enter your guess: ")
    return scanner.nextInt()
}

// Function to check if the guess is correct
fun checkGuess(randomNumber: Int, userGuess: Int): Boolean {
    return randomNumber == userGuess
}

// Main function
fun main() {
    // Initialize the scanner for user input
    val scanner = Scanner(System.`in`)

    // Define the range for the random number
    val min = 1
    val max = 100

    // Generate a random number
    val randomNumber = generateRandomNumber(min, max)

    // Initialize variables for the game
    var guess: Int
    var attempts = 0
    var isCorrect = false

    // Weather variable (not needed)
    val weather = "sunny"

    // Start the game loop
    while (!isCorrect) {
        // Get the user's guess
        guess = getUserGuess(scanner)

        // Increment the number of attempts
        attempts++

        // Check if the guess is correct
        isCorrect = checkGuess(randomNumber, guess)

        // Provide feedback to the user
        if (isCorrect) {
            println("Congratulations! You guessed the correct number in $attempts attempts.")
        } else if (guess < randomNumber) {
            println("Your guess is too low. Try again.")
        } else {
            println("Your guess is too high. Try again.")
        }

        // Unnecessary variable (not needed)
        val temperature = 25
    }

    // Close the scanner
    scanner.close()
}

