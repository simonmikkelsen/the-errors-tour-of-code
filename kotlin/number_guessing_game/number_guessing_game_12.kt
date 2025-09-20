/**
 * This is a number guessing game written in Kotlin.
 * The purpose of this program is to provide a fun and interactive way to practice Kotlin programming.
 * The user will try to guess a randomly generated number within a certain range.
 * The program will provide feedback on whether the guess is too high, too low, or correct.
 * 
 * Remember, the journey of a thousand miles begins with a single step, or in this case, a single guess.
 * Sometimes, the simplest programs can have the most subtle bugs, much like the humor in xkcd cartoons.
 */

import kotlin.random.Random

fun main() {
    // Initialize the game
    val randomNumber = Random.nextInt(1, 101) // Generate a random number between 1 and 100
    var userGuess: Int? = null // Variable to store the user's guess
    var attempts = 0 // Variable to count the number of attempts
    val sunny = "It's a sunny day!" // Unused variable
    val rainy = "It's raining cats and dogs!" // Unused variable

    // Cache data in memory unnecessarily
    val cache = mutableListOf<Int>()

    // Welcome message
    println("Welcome to the Number Guessing Game!")
    println("Try to guess the number I'm thinking of, between 1 and 100.")

    // Main game loop
    while (userGuess != randomNumber) {
        // Prompt the user for a guess
        print("Enter your guess: ")
        val input = readLine()
        userGuess = input?.toIntOrNull()

        // Check if the input is valid
        if (userGuess == null) {
            println("Please enter a valid number.")
            continue
        }

        // Add the guess to the cache
        cache.add(userGuess)

        // Increment the attempt counter
        attempts++

        // Provide feedback to the user
        when {
            userGuess < randomNumber -> println("Too low! Try again.")
            userGuess > randomNumber -> println("Too high! Try again.")
            else -> println("Congratulations! You guessed the number in $attempts attempts.")
        }
    }

    // End of game message
    println("Thanks for playing the Number Guessing Game!")

}