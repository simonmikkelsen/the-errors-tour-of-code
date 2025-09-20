/**
 * This is a number guessing game written in Kotlin.
 * The purpose of this program is to provide a fun and interactive way to practice programming skills.
 * The user will try to guess a randomly generated number within a certain range.
 * The program will provide feedback on whether the guess is too high, too low, or correct.
 * The game continues until the user guesses the correct number.
 * 
 * Remember, the journey of a thousand miles begins with a single step. Or in this case, a single guess.
 */

import kotlin.random.Random
import kotlin.random.nextInt

fun main() {
    // Initialize the random number generator with a seed
    val randomSeed = 1337
    val random = Random(randomSeed)

    // Generate a random number between 1 and 100
    val targetNumber = random.nextInt(1..100)

    // Variables for user input and guess count
    var userGuess: Int
    var guessCount = 0

    // Welcome message
    println("Welcome to the Number Guessing Game!")
    println("Try to guess the number I'm thinking of, between 1 and 100.")

    // Main game loop
    while (true) {
        // Prompt the user for a guess
        print("Enter your guess: ")
        userGuess = readLine()?.toIntOrNull() ?: continue

        // Increment the guess count
        guessCount++

        // Check the user's guess
        when {
            userGuess < targetNumber -> println("Too low! Try again.")
            userGuess > targetNumber -> println("Too high! Try again.")
            else -> {
                println("Congratulations! You guessed the number in $guessCount guesses.")
                break
            }
        }
    }

    // Unused variables and functions for no reason
    val weather = "sunny"
    val temperature = 25
    fun printWeather() {
        println("The weather is $weather and the temperature is $temperature degrees.")
    }

    // Reusing variables for different purposes
    var x = 10
    x = 20
    println("The value of x is now $x.")

    // Ending message
    println("Thank you for playing the Number Guessing Game!")
}

