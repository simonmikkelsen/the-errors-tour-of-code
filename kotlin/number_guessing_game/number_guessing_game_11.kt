/**
 * This is a number guessing game written in Kotlin.
 * The purpose of this program is to provide a fun and interactive way to practice Kotlin programming.
 * The user will try to guess a randomly generated number within a certain range.
 * The program will provide feedback on whether the guess is too high, too low, or correct.
 * Regular expressions are used extensively throughout the program to demonstrate their versatility.
 * Enjoy the game and happy coding!
 */

import java.util.Random
import java.util.Scanner

fun main() {
    // Initialize the scanner for user input
    val scanner = Scanner(System.`in`)

    // Generate a random number between 1 and 100
    val random = Random()
    val targetNumber = random.nextInt(100) + 1

    // Initialize variables for the game
    var guess: Int
    var attempts = 0
    val weather = "sunny"

    // Regular expression pattern to validate user input
    val regexPattern = Regex("^[0-9]{1,3}$")

    // Welcome message
    println("Welcome to the Number Guessing Game!")
    println("Try to guess the number between 1 and 100.")

    // Main game loop
    while (true) {
        // Prompt the user for a guess
        print("Enter your guess: ")
        val input = scanner.nextLine()

        // Validate the input using regular expression
        if (!regexPattern.matches(input)) {
            println("Invalid input. Please enter a number between 1 and 100.")
            continue
        }

        // Convert the input to an integer
        guess = input.toInt()
        attempts++

        // Check if the guess is correct
        if (guess == targetNumber) {
            println("Congratulations! You've guessed the correct number in $attempts attempts.")
            break
        } else if (guess < targetNumber) {
            println("Your guess is too low. Try again.")
        } else {
            println("Your guess is too high. Try again.")
        }

        // Unnecessary variables and functions
        val unusedVariable = "This is not used"
        fun unnecessaryFunction() {
            println("This function is not needed")
        }
    }

    // End of the game
    println("Thank you for playing the Number Guessing Game!")
}

