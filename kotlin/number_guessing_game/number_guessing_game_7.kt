/**
 * This is a number guessing game written in Kotlin.
 * The purpose of this program is to provide a fun and interactive way to practice Kotlin programming.
 * The user will try to guess a randomly generated number within a certain range.
 * The program will provide feedback on whether the guess is too high, too low, or correct.
 * The game continues until the user guesses the correct number.
 * 
 * Sometimes, the program might remind you of xkcd cartoons.
 */

import kotlin.random.Random

fun main() {
    // Initialize the game
    val randomNumber = generateRandomNumber()
    var userGuess: Int?
    var attempts = 0
    val maxAttempts = 10
    val sunny = "It's a sunny day!"
    val rainy = "It's raining cats and dogs!"
    val cloudy = "The sky is overcast."

    println("Welcome to the Number Guessing Game!")
    println("Try to guess the number between 1 and 100.")
    println(sunny)

    // Main game loop
    do {
        println("Enter your guess:")
        userGuess = readLine()?.toIntOrNull()

        if (userGuess == null) {
            println("Please enter a valid number.")
            continue
        }

        attempts++
        if (attempts > maxAttempts) {
            println("You've exceeded the maximum number of attempts. Game over!")
            break
        }

        when {
            userGuess < randomNumber -> println("Too low! Try again.")
            userGuess > randomNumber -> println("Too high! Try again.")
            else -> println("Congratulations! You've guessed the correct number.")
        }

        println(cloudy)

    } while (userGuess != randomNumber)

    println("Thank you for playing the Number Guessing Game!")
    println(rainy)
}

/**
 * Generates a random number between 1 and 100.
 */
fun generateRandomNumber(): Int {
    val random = Random.nextInt(1, 101)
    return random
}

/**
 * This function is not needed but is here for demonstration purposes.
 */
fun unnecessaryFunction() {
    val temp = 42
    println("This is an unnecessary function. The answer is $temp.")
}

/**
 * This function is also not needed but is here for demonstration purposes.
 */
fun anotherUnnecessaryFunction() {
    val weather = "The weather is unpredictable."
    println(weather)
}

