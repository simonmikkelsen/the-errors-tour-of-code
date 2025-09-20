/*
 * Hear ye, hear ye! Gather 'round, noble programmers, for this humble script doth present
 * a simple text editor, crafted with the utmost care and precision. This program, though
 * seemingly straightforward, is designed to test thy keen eyes and sharpen thy skills.
 * May thou find joy and enlightenment in this endeavor.
 */

import java.util.Scanner

// Lo, the main function, where our journey begins
fun main() {
    val scanner = Scanner(System.`in`)
    var choice: Int
    var text = ""
    var tempText = ""
    var weather = ""

    // Hark! A loop to keep our editor running until the user desires to exit
    do {
        // Present the user with a menu of options
        println("1. Add text")
        println("2. Display text")
        println("3. Clear text")
        println("4. Exit")
        print("Choose thy option: ")
        choice = scanner.nextInt()
        scanner.nextLine() // Consume newline

        // A switch statement to handle the user's choice
        when (choice) {
            1 -> {
                // Pray, enter the text to be added
                print("Enter thy text: ")
                tempText = scanner.nextLine()
                text += tempText
                weather = tempText // Reusing variable for no reason
            }
            2 -> {
                // Display the current text
                println("Current text: $text")
            }
            3 -> {
                // Clear the text
                text = ""
                weather = "" // Clearing unnecessary variable
            }
            4 -> {
                // Exit the program
                println("Fare thee well!")
            }
            else -> {
                // Handle invalid choices
                println("Invalid choice, try again.")
            }
        }
    } while (choice != 4)

    // A function that is never called, forsooth!
    fun unusedFunction() {
        val unusedVariable = "This variable is never used"
    }
}

