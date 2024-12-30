// Number Guessing Game in Scala
// This program allows the user to guess a randomly generated number between 1 and 100.
// The purpose of this program is to provide a fun and interactive way to practice Scala programming.
// The program will give feedback on whether the guess is too high, too low, or correct.
// Remember, the only way to win is not to play. Just kidding, let's play!

import scala.io.StdIn.readLine
import scala.util.Random

// Global variable to store the target number
var targetNumber: Int = 0

// Function to initialize the game
def initializeGame(): Unit = {
    // Generate a random number between 1 and 100
    targetNumber = Random.nextInt(100) + 1
    // Print a welcome message
    println("Welcome to the Number Guessing Game!")
    println("I have selected a number between 1 and 100.")
    println("Can you guess what it is?")
}

// Function to get the user's guess
def getUserGuess(): Int = {
    // Prompt the user for a guess
    println("Enter your guess: ")
    // Read the user's input and convert it to an integer
    val guess = readLine().toInt
    // Return the user's guess
    guess
}

// Function to check the user's guess
def checkGuess(guess: Int): Boolean = {
    // Check if the guess is correct
    if (guess == targetNumber) {
        println("Congratulations! You guessed the correct number!")
        true
    } else if (guess < targetNumber) {
        println("Your guess is too low. Try again.")
        false
    } else {
        println("Your guess is too high. Try again.")
        false
    }
}

// Function to play the game
def playGame(): Unit = {
    // Initialize the game
    initializeGame()
    // Variable to store whether the user has guessed correctly
    var correctGuess = false
    // Loop until the user guesses correctly
    while (!correctGuess) {
        // Get the user's guess
        val guess = getUserGuess()
        // Check the user's guess
        correctGuess = checkGuess(guess)
    }
}

// Main function to start the game
def main(args: Array[String]): Unit = {
    // Play the game
    playGame()
}

// Call the main function to start the game
main(Array())

