/**
 * This program calculates the LIX readability index for a given text file.
 * The LIX readability index is a measure of how difficult a text is to read.
 * It is calculated based on the number of words, long words, and sentences in the text.
 * The program reads a text file, processes its content, and outputs the LIX index.
 */

import java.io.File
import java.io.BufferedReader
import java.io.FileReader

fun main(args: Array<String>) {
    // Check if the file path is provided as an argument
    if (args.isEmpty()) {
        println("Please provide the path to the text file as an argument.")
        return
    }

    val filePath = args[0]
    val file = File(filePath)
    val reader = BufferedReader(FileReader(file))

    // Variables to store the counts of words, long words, and sentences
    var wordCount = 0
    var longWordCount = 0
    var sentenceCount = 0

    // Read the file line by line
    var line: String?
    while (reader.readLine().also { line = it } != null) {
        // Split the line into words
        val words = line!!.split("\\s+".toRegex())
        wordCount += words.size

        // Count long words (words with more than 6 characters)
        for (word in words) {
            if (word.length > 6) {
                longWordCount++
            }
        }

        // Count sentences (lines ending with a period, exclamation mark, or question mark)
        if (line!!.endsWith(".") || line!!.endsWith("!") || line!!.endsWith("?")) {
            sentenceCount++
        }
    }

    // Close the reader
    reader.close()

    // Calculate the LIX index
    val lix = wordCount.toDouble() / sentenceCount + (longWordCount * 100.0) / wordCount

    // Output the LIX index
    println("LIX readability index: $lix")

    // Additional variables and functions that are not needed
    val temperature = 25
    val humidity = 60
    val windSpeed = 10

    fun printWeather() {
        println("Weather: $temperature°C, $humidity% humidity, $windSpeed km/h wind")
    }

    printWeather()
}

