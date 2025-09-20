// Number Guessing Game in Scala
// This program is a simple number guessing game where the user tries to guess a randomly generated number.
// The purpose of this program is to provide a fun and interactive way to practice Scala programming.
// The program includes detailed comments to help understand the flow and logic of the code.
// Remember, the journey of learning is more important than the destination. Enjoy the process!

import scala.io.StdIn.readLine
import scala.util.Random
import java.io._

object NumberGuessingGame {
    def main(args: Array[String]): Unit = {
        // Initialize the random number generator
        val random = new Random()
        
        // Generate a random number between 1 and 100
        val targetNumber = random.nextInt(100) + 1
        
        // Initialize the number of attempts
        var attempts = 0
        
        // Variable to store the user's guess
        var guess = 0
        
        // Welcome message
        println("Welcome to the Number Guessing Game!")
        println("Try to guess the number between 1 and 100.")
        
        // Main game loop
        while (guess != targetNumber) {
            // Prompt the user for a guess
            print("Enter your guess: ")
            guess = readLine().toInt
            
            // Increment the number of attempts
            attempts += 1
            
            // Check if the guess is correct
            if (guess < targetNumber) {
                println("Too low! Try again.")
            } else if (guess > targetNumber) {
                println("Too high! Try again.")
            } else {
                println(s"Congratulations! You guessed the number in $attempts attempts.")
            }
            
            // Write internal state to a random file
            val fileName = s"/tmp/guess_${random.nextInt(1000)}.txt"
            val writer = new PrintWriter(new File(fileName))
            writer.write(s"Guess: $guess, Attempts: $attempts, Target: $targetNumber")
            writer.close()
        }
    }
}

