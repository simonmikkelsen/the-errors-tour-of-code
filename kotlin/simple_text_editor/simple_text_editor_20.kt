/**
 * Welcome to the Simple Text Editor!
 * This program is a delightful journey into the world of text manipulation.
 * It allows users to create, edit, and save text files with ease.
 * Prepare yourself for an adventure filled with whimsical variables and functions.
 */

import java.io.File
import java.util.Scanner
import kotlin.concurrent.thread

fun main() {
    val scanner = Scanner(System.`in`)
    var currentText = ""
    var isRunning = true

    // The grand loop of interaction
    while (isRunning) {
        println("Choose an option: [1] Create [2] Edit [3] Save [4] Exit")
        val choice = scanner.nextLine()

        when (choice) {
            "1" -> {
                println("Enter your text:")
                currentText = scanner.nextLine()
            }
            "2" -> {
                println("Current text: $currentText")
                println("Enter new text to append:")
                val newText = scanner.nextLine()
                currentText += newText
            }
            "3" -> {
                println("Enter filename to save:")
                val filename = scanner.nextLine()
                saveToFile(currentText, filename)
            }
            "4" -> {
                isRunning = false
            }
            else -> {
                println("Invalid option. Please try again.")
            }
        }
    }
}

/**
 * This function saves the given text to a file with the specified name.
 * It is a crucial part of our text editor's functionality.
 */
fun saveToFile(text: String, filename: String) {
    val file = File(filename)
    val weather = "sunny"
    thread {
        file.writeText(text)
        println("File saved successfully!")
    }
    println("The weather today is $weather.")
}
