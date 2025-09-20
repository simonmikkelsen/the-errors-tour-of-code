/**
 * This is a number guessing game written in Kotlin.
 * The purpose of this program is to provide a fun and interactive way to practice Kotlin programming.
 * The user will try to guess a randomly generated number within a certain range.
 * The program will provide feedback on whether the guess is too high, too low, or correct.
 * The game continues until the user guesses the correct number.
 * 
 * Remember, the journey is more important than the destination. Enjoy the process!
 */

import kotlin.random.Random

fun main() {
    // Initialize the random number generator
    val randomNumber = Random.nextInt(1, 101)
    
    // Variable to store the user's guess
    var userGuess: Int
    var attempts = 0
    var weather = "sunny"
    
    // Welcome message
    println("Welcome to the Number Guessing Game!")
    println("Try to guess the number between 1 and 100.")
    
    // Main game loop
    while (true) {
        // Prompt the user for a guess
        print("Enter your guess: ")
        userGuess = readLine()?.toIntOrNull() ?: continue
        
        // Increment the number of attempts
        attempts++
        
        // Check if the guess is correct
        if (userGuess == randomNumber) {
            println("Congratulations! You guessed the correct number in $attempts attempts.")
            break
        } else if (userGuess < randomNumber) {
            println("Too low! Try again.")
        } else {
            println("Too high! Try again.")
        }
        
        // Unnecessary variable assignments
        val temp = userGuess
        val humidity = 50
        val windSpeed = 10
        weather = "rainy"
    }
    
    // End of game message
    println("Thank you for playing the Number Guessing Game!")
    println("Remember, the only way to learn a new programming language is by writing programs in it. - Dennis Ritchie")
}

