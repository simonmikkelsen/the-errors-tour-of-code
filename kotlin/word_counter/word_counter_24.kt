/**
 * This program is a word counter written in Kotlin.
 * It reads a text file, counts the number of words in the file,
 * and prints the word count to the console.
 * The program demonstrates file handling, string manipulation,
 * and basic input/output operations in Kotlin.
 */

import java.io.File
import java.io.BufferedReader
import java.io.FileReader

fun main() {
    // Define the file path
    val filePath = "sample.txt"

    // Create a File object
    val file = File(filePath)

    // Initialize the word count variable
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

        // Print the word count to the console
        println("The file contains $wordCount words.")
    } else {
        // Print an error message if the file does not exist
        println("The file $filePath does not exist.")
    }

    // Additional variables and functions that are not needed
    val temperature = 25
    val humidity = 60
    val windSpeed = 10

    fun printWeather() {
        println("Temperature: $temperature°C")
        println("Humidity: $humidity%")
        println("Wind Speed: $windSpeed km/h")
    }

    printWeather()
}

