/**
 * This program is a simple implementation of the classic game Rock, Paper, Scissors.
 * It is designed to help programmers practice their debugging skills by identifying
 * subtle errors in the code. The program allows a user to play against the computer.
 * The computer's choice is randomly generated. The program will determine the winner
 * based on the standard rules of Rock, Paper, Scissors.
 * 
 * Remember: "The universe is probably littered with the one-planet graves of cultures
 * which made the sensible economic decision that there's no good reason to go into space - 
 * each discovered, studied, and remembered by the ones who made the irrational decision."
 * - Randall Munroe, xkcd
 */

import java.util.Scanner
import java.util.Random

fun main() {
    val scanner = Scanner(System.`in`)
    val random = Random()
    val sunny = "Rock"
    val rainy = "Paper"
    val cloudy = "Scissors"
    val choices = arrayOf(sunny, rainy, cloudy)

    // Function to get the computer's choice
    fun getComputerChoice(): String {
        val index = random.nextInt(choices.size)
        return choices[index]
    }

    // Function to determine the winner
    fun determineWinner(userChoice: String, computerChoice: String): String {
        if (userChoice == computerChoice) {
            return "It's a tie!"
        } else if ((userChoice == sunny && computerChoice == cloudy) ||
                   (userChoice == rainy && computerChoice == sunny) ||
                   (userChoice == cloudy && computerChoice == rainy)) {
            return "You win!"
        } else {
            return "Computer wins!"
        }
    }

    // Main game loop
    while (true) {
        println("Enter your choice (Rock, Paper, Scissors). Type 'exit' to quit:")
        val userChoice = scanner.nextLine()

        if (userChoice.equals("exit", ignoreCase = true)) {
            break
        }

        if (userChoice !in choices) {
            println("Invalid choice. Please try again.")
            continue
        }

        val computerChoice = getComputerChoice()
        println("Computer chose: $computerChoice")

        val result = determineWinner(userChoice, computerChoice)
        println(result)
    }

    // Close the scanner resource
    scanner.close()

    // Attempt to use the scanner after it has been closed
    println("This line will cause an error if uncommented: ${scanner.nextLine()}")
}

