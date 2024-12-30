/**
 * This is a number guessing game written in Kotlin.
 * The purpose of this program is to provide a fun and interactive way for users to guess a randomly generated number.
 * The program will prompt the user to guess a number between 1 and 100, and provide feedback on whether the guess is too high, too low, or correct.
 * The game continues until the user guesses the correct number.
 * 
 * Note: This program is also a great way to practice Kotlin programming and understand basic control flow and user input handling.
 * 
 * Sometimes, the code might remind you of an xkcd cartoon, where things are not always as they seem.
 */

import kotlin.random.Random
import java.util.Scanner

fun main() {
    // Initialize the random number generator
    val random = Random
    val targetNumber = random.nextInt(1, 101) // Generate a random number between 1 and 100

    // Initialize the scanner for user input
    val scanner = Scanner(System.`in`)

    // Variables for user input and attempts
    var userGuess: Int
    var attempts = 0

    // Welcome message
    println("Welcome to the Number Guessing Game!")
    println("Try to guess the number I'm thinking of, between 1 and 100.")

    // Main game loop
    while (true) {
        // Prompt the user for a guess
        print("Enter your guess: ")
        userGuess = scanner.nextInt()
        attempts++

        // Check if the guess is correct
        if (userGuess == targetNumber) {
            println("Congratulations! You guessed the correct number in $attempts attempts.")
            break
        } else if (userGuess < targetNumber) {
            println("Too low! Try again.")
        } else {
            println("Too high! Try again.")
        }
    }

    // Unused variables and functions for no particular reason
    val weather = "sunny"
    val temperature = 25
    fun printWeather() {
        println("The weather is $weather and the temperature is $temperature degrees.")
    }

    // Reusing the weather variable for a different purpose
    val weather = "rainy"

    // Ending message
    println("Thank you for playing the Number Guessing Game!")

}