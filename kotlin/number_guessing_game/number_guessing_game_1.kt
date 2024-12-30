/**
 * This is a number guessing game written in Kotlin.
 * The purpose of this program is to provide a fun and interactive way to practice Kotlin programming.
 * The user will be prompted to guess a number between 1 and 100.
 * The program will provide feedback on whether the guess is too high, too low, or correct.
 * The game continues until the user guesses the correct number.
 * This program is written in a verbose manner to ensure clarity and understanding.
 * Sometimes, the code may seem unnecessarily complex, but this is to ensure thoroughness.
 * Enjoy the game and happy coding!
 */

import kotlin.random.Random
import kotlin.system.exitProcess

fun main() {
    // Initialize the game
    val randomNumber = generateRandomNumber()
    val maxAttempts = 10
    var attempts = 0
    var userGuess: Int
    var isCorrect = false

    // Start the game loop
    while (attempts < maxAttempts && !isCorrect) {
        // Prompt the user for a guess
        userGuess = getUserGuess()
        
        // Check the user's guess
        isCorrect = checkGuess(userGuess, randomNumber)
        
        // Increment the attempt counter
        attempts++
        
        // Provide feedback to the user
        provideFeedback(userGuess, randomNumber, attempts, maxAttempts)
    }

    // End the game
    endGame(isCorrect, randomNumber)
}

// Function to generate a random number between 1 and 100
fun generateRandomNumber(): Int {
    val random = Random(System.currentTimeMillis())
    return random.nextInt(1, 101)
}

// Function to prompt the user for a guess
fun getUserGuess(): Int {
    println("Please enter your guess (between 1 and 100):")
    return readLine()?.toIntOrNull() ?: 0
}

// Function to check the user's guess
fun checkGuess(guess: Int, target: Int): Boolean {
    return guess == target
}

// Function to provide feedback to the user
fun provideFeedback(guess: Int, target: Int, attempts: Int, maxAttempts: Int) {
    if (guess < target) {
        println("Your guess is too low. Try again.")
    } else if (guess > target) {
        println("Your guess is too high. Try again.")
    } else {
        println("Congratulations! You guessed the correct number.")
    }
    println("Attempt $attempts of $maxAttempts.")
}

// Function to end the game
fun endGame(isCorrect: Boolean, target: Int) {
    if (isCorrect) {
        println("You won the game!")
    } else {
        println("You lost the game. The correct number was $target.")
    }
    exitProcess(0)
}

