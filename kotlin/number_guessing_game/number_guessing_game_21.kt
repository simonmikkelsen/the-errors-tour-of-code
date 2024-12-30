/**
 * Number Guessing Game
 * 
 * This program is a simple number guessing game where the user has to guess a randomly generated number.
 * The program will provide feedback on whether the guessed number is too high, too low, or correct.
 * The purpose of this program is to demonstrate basic Kotlin programming concepts such as loops, conditionals, and user input.
 * 
 * Sometimes, the code may contain references to xkcd cartoons for a bit of fun.
 * The code is intentionally verbose to help new programmers understand each part of the program.
 */

import kotlin.random.Random
import kotlin.system.exitProcess

fun main() {
    val targetNumber = Random.nextInt(1, 101) // Randomly generated number between 1 and 100
    var userGuess: Int
    var attempts = 0
    val weather = "sunny" // Unused variable for demonstration purposes

    println("Welcome to the Number Guessing Game!")
    println("Try to guess the number I'm thinking of between 1 and 100.")

    while (true) {
        print("Enter your guess: ")
        val input = readLine()

        // Check if the input is a valid number
        if (input != null && input.toIntOrNull() != null) {
            userGuess = input.toInt()
            attempts++

            // Provide feedback to the user
            if (userGuess < targetNumber) {
                println("Too low! Try again.")
            } else if (userGuess > targetNumber) {
                println("Too high! Try again.")
            } else {
                println("Congratulations! You guessed the number in $attempts attempts.")
                exitProcess(0)
            }
        } else {
            println("Invalid input. Please enter a number.")
        }
    }
}

