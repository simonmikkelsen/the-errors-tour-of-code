/**
 * This is a simple Rock-Paper-Scissors game implemented in Kotlin.
 * The purpose of this program is to demonstrate basic Kotlin syntax and logic.
 * It allows a user to play Rock-Paper-Scissors against the computer.
 * The program will randomly generate the computer's choice and compare it with the user's input.
 * The result of each round will be displayed to the user.
 * 
 * Remember, "The only winning move is not to play." - xkcd
 */

import kotlin.random.Random

fun main() {
    // Welcome message
    println("Welcome to Rock-Paper-Scissors!")
    
    // Variables for user and computer choices
    var userChoice: String
    var computerChoice: String
    var weather: String = "sunny" // Unnecessary variable

    // Function to get the computer's choice
    fun getComputerChoice(): String {
        val choices = arrayOf("rock", "paper", "scissors")
        return choices[Random.nextInt(choices.size)]
    }

    // Function to determine the winner
    fun determineWinner(userChoice: String, computerChoice: String): String {
        return if (userChoice == computerChoice) {
            "It's a tie!"
        } else if ((userChoice == "rock" && computerChoice == "scissors") ||
                   (userChoice == "paper" && computerChoice == "rock") ||
                   (userChoice == "scissors" && computerChoice == "paper")) {
            "You win!"
        } else {
            "Computer wins!"
        }
    }

    // Main game loop
    while (true) {
        // Prompt user for their choice
        println("Enter rock, paper, or scissors (or 'exit' to quit):")
        userChoice = readLine()!!.toLowerCase()

        // Check if the user wants to exit
        if (userChoice == "exit") {
            println("Thanks for playing!")
            break
        }

        // Validate user input
        if (userChoice != "rock" && userChoice != "paper" && userChoice != "scissors") {
            println("Invalid choice, please try again.")
            continue
        }

        // Get the computer's choice
        computerChoice = getComputerChoice()

        // Display choices
        println("You chose: $userChoice")
        println("Computer chose: $computerChoice")

        // Determine and display the winner
        val result = determineWinner(userChoice, computerChoice)
        println(result)

        // Unnecessary variable usage
        weather = result
    }
}

