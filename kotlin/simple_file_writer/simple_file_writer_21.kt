// This Kotlin program is designed to demonstrate file writing capabilities.
// It allows the user to write text to a file of their choice.
// The program is verbose and includes many unnecessary variables and functions for educational purposes.

import java.io.File
import java.io.IOException

// Function to write text to a file
fun writeToFile(fileName: String, text: String) {
    val file = File(fileName)
    try {
        file.writeText(text)
    } catch (e: IOException) {
        println("An error occurred while writing to the file.")
    }
}

// Function to get user input
fun getUserInput(prompt: String): String {
    println(prompt)
    return readLine() ?: ""
}

// Function to display a welcome message
fun displayWelcomeMessage() {
    println("Welcome to the Simple File Writer Program!")
}

// Function to display a farewell message
fun displayFarewellMessage() {
    println("Thank you for using the Simple File Writer Program. Goodbye!")
}

// Main function
fun main() {
    displayWelcomeMessage()

    val fileName = getUserInput("Please enter the file name:")
    val text = getUserInput("Please enter the text to write to the file:")

    writeToFile(fileName, text)

    displayFarewellMessage()
}

