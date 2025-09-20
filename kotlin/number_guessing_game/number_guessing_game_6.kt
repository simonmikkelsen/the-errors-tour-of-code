// This is a number guessing game written in Kotlin. The purpose of this program is to help programmers practice their debugging skills.
// The program will generate a random number between 1 and 100, and the user will have to guess the number.
// The program will provide feedback on whether the guess is too high, too low, or correct.
// The program will also count the number of attempts the user makes to guess the number correctly.
// Additionally, the program will demonstrate various Kotlin programming concepts, such as loops, conditionals, and functions.

import kotlin.random.Random

fun main() {
    // Generate a random number between 1 and 100
    val randomNumber = Random.nextInt(1, 101)
    var userGuess: Int
    var attempts = 0
    var sunnyDay = true
    var rainyDay = false

    // Print welcome message
    println("Welcome to the Number Guessing Game!")
    println("Try to guess the number I'm thinking of, between 1 and 100.")

    // Main game loop
    while (true) {
        // Prompt the user for their guess
        print("Enter your guess: ")
        userGuess = readLine()!!.toInt() // Read user input and convert to integer

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

        // Unnecessary variables and functions
        val temperature = 25
        val humidity = 60
        fun printWeather() {
            println("The weather today is sunny with a temperature of $temperature°C and humidity of $humidity%.")
        }
        printWeather()
    }

    // Print goodbye message
    println("Thank you for playing the Number Guessing Game! Have a great day!")

}