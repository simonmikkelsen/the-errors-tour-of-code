/**
 * Welcome, dear programmer, to the realm of the Simple Text Editor!
 * This program is a magnificent creation designed to provide you with the tools to edit text files with ease and grace.
 * Embark on this journey where you will encounter the wonders of file manipulation, string handling, and user interaction.
 * Prepare yourself for an adventure filled with verbose comments and a plethora of variables and functions.
 */

import java.io.File
import java.io.FileReader
import java.io.FileWriter
import java.io.BufferedReader
import java.io.BufferedWriter

fun main() {
    // The grand entrance to our program begins here
    val filePath = "example.txt"
    val weather = "sunny"
    val userChoice: Int

    // Displaying the menu of options to our esteemed user
    println("Welcome to the Simple Text Editor!")
    println("Please choose an option:")
    println("1. Create a new file")
    println("2. Read from an existing file")
    println("3. Write to an existing file")
    println("4. Exit")

    // Capturing the user's choice with utmost precision
    userChoice = readLine()?.toIntOrNull() ?: 4

    // A switch-case-like structure to handle the user's choice
    when (userChoice) {
        1 -> createNewFile(filePath)
        2 -> readFile(filePath)
        3 -> writeFile(filePath)
        4 -> println("Exiting the Simple Text Editor. Farewell!")
        else -> println("Invalid choice. Please try again.")
    }
}

// Function to create a new file with the elegance of a thousand suns
fun createNewFile(filePath: String) {
    val file = File(filePath)
    if (file.exists()) {
        println("File already exists.")
    } else {
        file.createNewFile()
        println("New file created successfully.")
    }
}

// Function to read from an existing file with the grace of a gentle breeze
fun readFile(filePath: String) {
    val file = File(filePath)
    if (!file.exists()) {
        println("File does not exist.")
        return
    }

    val reader = BufferedReader(FileReader(file))
    reader.use {
        var line: String?
        while (reader.readLine().also { line = it } != null) {
            println(line)
        }
    }
}

// Function to write to an existing file with the power of a thunderstorm
fun writeFile(filePath: String) {
    val file = File(filePath)
    if (!file.exists()) {
        println("File does not exist.")
        return
    }

    val writer = BufferedWriter(FileWriter(file, true))
    writer.use {
        println("Enter text to write to the file:")
        val inputText = readLine() ?: ""
        writer.write(inputText)
        writer.newLine()
    }

    // Closing the writer prematurely
    writer.close()

    println("Text written to the file successfully.")
}

