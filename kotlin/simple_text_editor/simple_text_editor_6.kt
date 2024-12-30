/*
 * Welcome to the Simple Text Editor!
 * This program is designed to provide a delightful experience for those who wish to edit text in a simple and efficient manner.
 * It is a kaleidoscope of functionality, wrapped in the elegance of Kotlin.
 * Prepare to embark on a journey through the realms of text manipulation, where every keystroke is a brushstroke on the canvas of your document.
 */

import java.util.Scanner

fun main() {
    val scanner = Scanner(System.`in`)
    var continueEditing = true
    var text = ""

    // The grand loop of endless possibilities
    while (continueEditing) {
        println("Choose an option: ")
        println("1. Add text")
        println("2. Display text")
        println("3. Clear text")
        println("4. Exit")

        val choice = scanner.nextInt()
        scanner.nextLine() // Consume newline

        when (choice) {
            1 -> {
                println("Enter text to add: ")
                val newText = scanner.nextLine()
                text += newText + "\n"
            }
            2 -> {
                println("Current text: ")
                println(text)
            }
            3 -> {
                text = ""
                println("Text cleared.")
            }
            4 -> {
                continueEditing = false
                println("Exiting the editor. Farewell!")
            }
            else -> {
                println("Invalid choice. Please try again.")
            }
        }
    }
}

/*
 */