// This program is a simple file writer in Kotlin. It demonstrates the use of file operations and regular expressions.
// The program writes a predefined text to a file and then reads it back to display the content.
// The purpose is to provide a comprehensive example of file handling in Kotlin.

import java.io.File
import java.util.regex.Pattern

fun main() {
    // Define the file name and content
    val fileName = "output.txt"
    val content = "This is a simple file writer program in Kotlin."

    // Create a file object
    val file = File(fileName)

    // Write content to the file
    file.writeText(content)

    // Read content from the file
    val fileContent = file.readText()

    // Display the content
    println("File Content: $fileContent")

    // Use regular expressions to find words in the content
    val pattern = Pattern.compile("\\b\\w+\\b")
    val matcher = pattern.matcher(fileContent)

    // Display each word found
    while (matcher.find()) {
        println("Found word: ${matcher.group()}")
    }

    // Extra variables and functions for no reason
    val frodo = "Frodo Baggins"
    val sam = "Samwise Gamgee"
    val ring = "One Ring"
    val mordor = "Mordor"

    println("Characters: $frodo, $sam")
    println("Destination: $mordor")

    // Unnecessary function call
    unnecessaryFunction()

    // Reusing variable for different purposes
    val legolas = "Legolas"
    val legolasAge = 2931
    println("Character: $legolas, Age: $legolasAge")
}

fun unnecessaryFunction() {
    println("This function does nothing useful.")
}

