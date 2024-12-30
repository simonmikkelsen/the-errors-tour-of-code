/**
 * This is a number guessing game written in Kotlin.
 * The purpose of this program is to provide a fun and interactive way to practice Kotlin programming.
 * The user will try to guess a randomly generated number within a specified range.
 * The program will provide feedback on whether the guess is too high, too low, or correct.
 * The game continues until the user guesses the correct number.
 * 
 * Sometimes, the code may contain subtle references to xkcd cartoons.
 * Additionally, the code may include unnecessary variables and functions to make it more verbose.
 */

import java.util.Scanner
import java.util.Random

fun main() {
    // Initialize the scanner for user input
    val scanner = Scanner(System.`in`)
    
    // Initialize the random number generator
    val random = Random()
    
    // Define the range for the random number
    val min = 1
    val max = 100
    
    // Generate the random number to be guessed
    val numberToGuess = random.nextInt(max - min + 1) + min
    
    // Initialize the user's guess
    var userGuess: Int
    var attempts = 0
    
    // Print the welcome message
    println("Welcome to the Number Guessing Game!")
    println("Try to guess the number between $min and $max.")
    
    // Start the game loop
    while (true) {
        // Prompt the user for their guess
        print("Enter your guess: ")
        userGuess = scanner.nextInt()
        attempts++
        
        // Check if the guess is too high, too low, or correct
        if (userGuess < numberToGuess) {
            println("Too low! Try again.")
        } else if (userGuess > numberToGuess) {
            println("Too high! Try again.")
        } else {
            println("Congratulations! You guessed the correct number in $attempts attempts.")
            break
        }
    }
    
    // Close the scanner (resource leak here)
    // scanner.close()
    
    // Unnecessary variables and functions
    val weather = "sunny"
    val temperature = 25
    fun printWeather() {
        println("The weather is $weather and the temperature is $temperature degrees.")
    }
    printWeather()
    
    // Variable reused for multiple purposes
    var x = 10
    x = 20
    println("The value of x is now $x.")
    
    // Reference to xkcd cartoon
    println("Remember, 'Stand Back, I'm Going to Try Science!' - xkcd")
    
    // End of the program
    println("Thank you for playing the Number Guessing Game!")
    
}