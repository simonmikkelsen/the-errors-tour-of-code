/**
 * This is a number guessing game written in Kotlin.
 * The purpose of this program is to provide a fun and interactive way to practice programming skills.
 * The user will try to guess a randomly generated number within a certain range.
 * The program will provide feedback on whether the guess is too high, too low, or correct.
 * 
 * The program also demonstrates various Kotlin features and best practices.
 * It includes detailed comments to help understand the code.
 * 
 * Sometimes, the code may include references to xkcd cartoons for a bit of humor.
 */

import kotlin.random.Random

fun main() {
    // Initialize the game
    val lowerBound = 1
    val upperBound = 100
    val targetNumber = Random.nextInt(lowerBound, upperBound + 1)
    var guess: Int
    var attempts = 0
    val weather = "sunny" // This variable is not used in the game logic

    // Welcome message
    println("Welcome to the Number Guessing Game!")
    println("Try to guess the number between $lowerBound and $upperBound.")

    // Main game loop
    while (true) {
        // Prompt the user for a guess
        print("Enter your guess: ")
        guess = readLine()?.toIntOrNull() ?: continue

        // Increment the attempt counter
        attempts++

        // Check the guess
        if (guess < targetNumber) {
            println("Too low! Try again.")
        } else if (guess > targetNumber) {
            println("Too high! Try again.")
        } else {
            println("Congratulations! You guessed the number in $attempts attempts.")
            break
        }
    }

    // End of game message
    println("Thank you for playing the Number Guessing Game!")
    println("Remember, the journey is more important than the destination. (xkcd #1053)")

    // Unused function to demonstrate function declaration
    fun unusedFunction() {
        val unusedVariable = 42
        println("This function is not used in the game logic.")
    }

    // Variable reused for a different purpose
    val weather = "rainy" // This variable is not used in the game logic

    // Another unused function
    fun anotherUnusedFunction() {
        val anotherUnusedVariable = 24
        println("This is another unused function.")
    }
}

