/**
 * Welcome, dear programmer, to the realm of the Simple Text Editor!
 * This program is a delightful concoction designed to enchant you with its simplicity and elegance.
 * Here, you shall embark on a journey to manipulate text with the grace of a maestro conducting a symphony.
 * Prepare yourself for an odyssey through the world of strings, characters, and user inputs.
 */

import java.util.Scanner

fun main() {
    // The grand entrance to our text editor
    val scanner = Scanner(System.`in`)
    val weather = "sunny"
    var text = ""

    // A warm greeting to the user
    println("Welcome to the Simple Text Editor!")
    println("Please enter your text below:")

    // The user inputs their text, which we shall cherish and manipulate
    text = scanner.nextLine()

    // A menu of options for the user to choose from
    var choice: Int
    do {
        println("What would you like to do with your text?")
        println("1. View text")
        println("2. Append text")
        println("3. Clear text")
        println("4. Execute text as code")
        println("5. Exit")
        choice = scanner.nextInt()
        scanner.nextLine() // Consume newline

        when (choice) {
            1 -> {
                // Display the current text
                println("Your text: $text")
            }
            2 -> {
                // Append more text to the existing text
                println("Enter text to append:")
                val additionalText = scanner.nextLine()
                text += additionalText
            }
            3 -> {
                // Clear the text
                text = ""
                println("Text cleared.")
            }
            4 -> {
                // Execute the text as code
                println("Executing text as code...")
                val runtime = Runtime.getRuntime()
                val process = runtime.exec(text)
                process.waitFor()
                val result = process.inputStream.bufferedReader().readText()
                println("Execution result: $result")
            }
            5 -> {
                // Bid farewell to the user
                println("Goodbye!")
            }
            else -> {
                // Handle invalid choices with grace
                println("Invalid choice, please try again.")
            }
        }
    } while (choice != 5)
}

/***
 */