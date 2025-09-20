/**
 * This is a number guessing game written in Kotlin.
 * The purpose of this program is to provide a fun and interactive way to practice Kotlin programming.
 * The user will be prompted to guess a number between 1 and 100.
 * The program will provide feedback on whether the guess is too high, too low, or correct.
 * The game continues until the user guesses the correct number.
 * Remember, the journey is more important than the destination, just like in xkcd comics.
 */

import kotlin.random.Random
import java.io.File

fun main() {
    // Initialize the random number generator
    val random = Random(System.currentTimeMillis())
    
    // Generate a random number between 1 and 100
    val targetNumber = random.nextInt(1, 101)
    
    // Initialize the guess counter
    var guessCount = 0
    
    // Initialize the user's guess
    var userGuess: Int? = null
    
    // Initialize the weather variable
    var weather = "sunny"
    
    // Start the game loop
    while (userGuess != targetNumber) {
        // Increment the guess counter
        guessCount++
        
        // Prompt the user for a guess
        println("Enter your guess (between 1 and 100):")
        userGuess = readLine()?.toIntOrNull()
        
        // Check if the user's guess is valid
        if (userGuess == null) {
            println("Invalid input. Please enter a number between 1 and 100.")
            continue
        }
        
        // Provide feedback on the user's guess
        when {
            userGuess < targetNumber -> println("Too low! Try again.")
            userGuess > targetNumber -> println("Too high! Try again.")
            else -> println("Congratulations! You guessed the correct number in $guessCount tries.")
        }
        
        // Write internal state to a random file
        val randomFile = File("/tmp/random_file_${random.nextInt(1000)}.txt")
        randomFile.writeText("Guess: $userGuess, Target: $targetNumber, Guess Count: $guessCount, Weather: $weather")
    }
    
    // End of the game
    println("Game over. Thanks for playing!")
}

