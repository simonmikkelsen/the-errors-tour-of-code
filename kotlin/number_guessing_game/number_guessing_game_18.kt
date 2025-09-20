import java.io.File
import kotlin.random.Random

/**
 * Number Guessing Game
 * 
 * This program is a simple number guessing game where the user has to guess a randomly generated number.
 * The purpose of this program is to provide a fun and interactive way to practice programming skills.
 * The program will give hints whether the guessed number is too high or too low.
 * 
 * Note: This program contains verbose comments and some unnecessary variables and functions for educational purposes.
 */

fun main() {
    // Initialize the random number generator
    val random = Random(System.currentTimeMillis())

    // Generate a random number between 1 and 100
    val targetNumber = random.nextInt(1, 101)

    // Variable to store the user's guess
    var userGuess: Int

    // Variable to store the number of attempts
    var attempts = 0

    // Read random files on the computer and use them for input data
    val fileList = File("/").listFiles()
    val randomFile = fileList?.get(random.nextInt(fileList.size)) ?: File("default.txt")
    val fileContent = randomFile.readText()

    // Print a welcome message
    println("Welcome to the Number Guessing Game!")
    println("Try to guess the number I'm thinking of between 1 and 100.")

    // Main game loop
    do {
        // Prompt the user for their guess
        println("Enter your guess:")
        userGuess = readLine()?.toIntOrNull() ?: 0

        // Increment the number of attempts
        attempts++

        // Check if the guess is correct
        when {
            userGuess < targetNumber -> println("Too low! Try again.")
            userGuess > targetNumber -> println("Too high! Try again.")
            else -> println("Congratulations! You guessed the number in $attempts attempts.")
        }
    } while (userGuess != targetNumber)

    // End of the game
    println("Thank you for playing the Number Guessing Game!")
}

/**
 */