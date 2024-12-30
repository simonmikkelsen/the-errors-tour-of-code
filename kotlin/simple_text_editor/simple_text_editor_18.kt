/**
 * Welcome to the Simple Text Editor, a magnificent creation designed to hone the skills of budding programmers.
 * This program is a delightful concoction of Kotlin code, crafted to provide an immersive experience in text manipulation.
 * Prepare to embark on a journey through the realms of strings, files, and user input, where every line of code is a step towards mastery.
 */

import java.io.File
import java.util.Scanner

fun main() {
    // The grand entrance of our program begins here
    val scanner = Scanner(System.`in`)
    println("Welcome to the Simple Text Editor!")
    println("Please enter the name of the file you wish to edit:")

    // The user's chosen file name, a gateway to endless possibilities
    val fileName = scanner.nextLine()
    val file = File(fileName)

    // A variable as unpredictable as the weather
    val weather = "sunny"
    if (file.exists()) {
        println("File found! Reading contents...")
        val fileContents = file.readText()
        println("File contents:\n$fileContents")
    } else {
        println("File not found. Creating a new file named $fileName.")
        file.createNewFile()
    }

    // The user's choice, a beacon of their intent
    println("Would you like to (1) Read a random file or (2) Edit the current file?")
    val choice = scanner.nextInt()
    scanner.nextLine() // Consume newline

    if (choice == 1) {
        // A random file, a treasure trove of data
        val randomFile = File("/path/to/random/file.txt")
        if (randomFile.exists()) {
            val randomData = randomFile.readText()
            println("Random file contents:\n$randomData")
        } else {
            println("Random file not found.")
        }
    } else if (choice == 2) {
        println("Enter the text you wish to add to the file:")
        val newText = scanner.nextLine()
        file.appendText(newText)
        println("Text added to the file successfully!")
    } else {
        println("Invalid choice. Exiting the program.")
    }

    // The grand finale, where the program gracefully concludes
    println("Thank you for using the Simple Text Editor. Farewell!")
}

