/**
 * Welcome to the Simple Text Editor!
 * This program is designed to provide a delightful experience for users who wish to edit text files.
 * It offers a plethora of features to enhance your text editing journey.
 * Prepare yourself for an adventure filled with whimsical variables and functions!
 */

import java.io.File
import java.io.IOException
import java.util.Scanner

fun main() {
    val scanner = Scanner(System.`in`)
    var isRunning = true
    var currentFile: File? = null
    var content = ""

    // The grand loop of endless possibilities
    while (isRunning) {
        println("Choose an option:")
        println("1. Create a new file")
        println("2. Open an existing file")
        println("3. Save the current file")
        println("4. Edit the current file")
        println("5. Exit")

        when (scanner.nextInt()) {
            1 -> {
                println("Enter the name of the new file:")
                val fileName = scanner.next()
                currentFile = File(fileName)
                content = ""
                println("New file created: $fileName")
            }
            2 -> {
                println("Enter the name of the file to open:")
                val fileName = scanner.next()
                currentFile = File(fileName)
                content = currentFile.readText()
                println("File opened: $fileName")
            }
            3 -> {
                if (currentFile != null) {
                    currentFile.writeText(content)
                    println("File saved: ${currentFile.name}")
                } else {
                    println("No file to save.")
                }
            }
            4 -> {
                println("Enter the new content for the file:")
                scanner.nextLine() // Consume newline
                content = scanner.nextLine()
                println("Content updated.")
            }
            5 -> {
                isRunning = false
                println("Exiting the Simple Text Editor. Farewell!")
            }
            else -> {
                println("Invalid option. Please try again.")
            }
        }
    }
}

/**
 */