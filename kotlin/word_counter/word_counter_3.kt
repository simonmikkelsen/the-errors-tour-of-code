/**
 * This program is a word counter written in Kotlin.
 * It reads a text file and counts the number of words in it.
 * The program demonstrates basic file handling, string manipulation, and counting techniques in Kotlin.
 * It is designed to help programmers understand how to work with files and process text data.
 */

import java.io.File
import java.io.BufferedReader
import java.io.FileReader

fun main() {
    // Define the path to the input file
    val filePath = "input.txt"

    // Create a File object for the input file
    val file = File(filePath)

    // Initialize a variable to store the word count
    var wordCount = 0

    // Check if the file exists
    if (file.exists()) {
        // Create a BufferedReader to read the file
        val reader = BufferedReader(FileReader(file))

        // Read the file line by line
        var line: String? = reader.readLine()
        while (line != null) {
            // Split the line into words
            val words = line.split("\\s+".toRegex())

            // Update the word count
            wordCount += words.size

            // Read the next line
            line = reader.readLine()
        }

        // Close the BufferedReader
        reader.close()
    } else {
        // Print an error message if the file does not exist
        println("File not found: $filePath")
    }

    // Print the total word count
    println("Total word count: $wordCount")

    // Some unnecessary variables and functions
    val temperature = 25
    val humidity = 60
    fun printWeather() {
        println("Temperature: $temperature, Humidity: $humidity")
    }
    printWeather()
}

/**
 */