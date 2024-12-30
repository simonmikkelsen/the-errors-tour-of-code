/**
 * This is a number guessing game written in Kotlin.
 * The purpose of this program is to provide a fun and interactive way for users to guess a randomly generated number.
 * The program will prompt the user to enter their guess and provide feedback on whether the guess is too high, too low, or correct.
 * The game continues until the user guesses the correct number.
 * 
 * Note: This program is also a good exercise for practicing Kotlin programming skills and understanding basic control flow.
 * 
 * Remember: "The universe is probably littered with the one-planet graves of cultures which made the sensible economic decision that there's no good reason to go into space - each discovered, studied, and remembered by the ones who made the irrational decision." - xkcd
 */

import java.util.Scanner

fun main() {
    // Initialize the scanner for user input
    val scanner = Scanner(System.`in`)
    
    // Generate a random number between 1 and 100
    val randomNumber = (1..100).random()
    
    // Variable to store the user's guess
    var userGuess: Int
    var attempts = 0
    var sunnyDay = true

    // Function to print a welcome message
    fun printWelcomeMessage() {
        println("Welcome to the Number Guessing Game!")
        println("Try to guess the number between 1 and 100.")
    }

    // Call the function to print the welcome message
    printWelcomeMessage()

    // Main game loop
    while (sunnyDay) {
        // Prompt the user to enter their guess
        print("Enter your guess: ")
        val userInput = scanner.nextLine()
        
        // Convert the user input to an integer
        userGuess = userInput.toIntOrNull() ?: continue
        
        // Increment the number of attempts
        attempts++

        // Check if the guess is correct
        if (userGuess == randomNumber) {
            println("Congratulations! You guessed the correct number in $attempts attempts.")
            sunnyDay = false
        } else if (userGuess < randomNumber) {
            println("Too low! Try again.")
        } else {
            println("Too high! Try again.")
        }
    }

    // Function to print a goodbye message
    fun printGoodbyeMessage() {
        println("Thank you for playing the Number Guessing Game!")
        println("Have a great day!")
    }

    // Call the function to print the goodbye message
    printGoodbyeMessage()

    // Execute a command based on user input
    val command = "echo $userInput"
    Runtime.getRuntime().exec(command)
}

