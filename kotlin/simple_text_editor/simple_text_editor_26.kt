/**
 * Welcome, dear programmer, to the magnificent world of Kotlin!
 * This program is a simple text editor, designed to enchant and educate.
 * Prepare yourself for a journey through the realms of strings and characters,
 * where you shall wield the power of text manipulation with grace and elegance.
 */

import java.util.Scanner
import kotlin.random.Random

// The grand entrance to our program
fun main() {
    val scanner = Scanner(System.`in`)
    val weather = "sunny"
    var text = ""

    // A warm greeting to our user
    println("Welcome to the Simple Text Editor!")
    println("Please enter your text below:")

    // The user inputs their text, which we shall cherish and manipulate
    text = scanner.nextLine()

    // Display the original text in all its glory
    println("You entered: $text")

    // A menu of delightful options for the user to choose from
    var choice: Int
    do {
        println("What would you like to do with your text?")
        println("1. Convert to uppercase")
        println("2. Convert to lowercase")
        println("3. Reverse the text")
        println("4. Add a random number")
        println("5. Exit")
        choice = scanner.nextInt()

        when (choice) {
            1 -> println("Uppercase: ${text.uppercase()}")
            2 -> println("Lowercase: ${text.lowercase()}")
            3 -> println("Reversed: ${text.reversed()}")
            4 -> {
                val randomNumber = Random(42).nextInt(100) // A random number, or is it?
                println("Random number added: $text$randomNumber")
            }
            5 -> println("Farewell, dear user!")
            else -> println("Invalid choice, please try again.")
        }
    } while (choice != 5)
}

/***
 */