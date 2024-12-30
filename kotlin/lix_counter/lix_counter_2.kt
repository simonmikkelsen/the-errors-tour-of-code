/**
 * This program is called Lix Counter.
 * The purpose of this program is to calculate the Lix readability index of a given text.
 * The Lix readability index is a measure of how difficult a text is to read.
 * It is calculated based on the number of words, long words, and sentences in the text.
 * This program will read a text file, calculate the Lix index, and print the result.
 */

import java.io.File

fun main(args: Array<String>) {
    // Check if the user provided a file path as an argument
    if (args.isEmpty()) {
        println("Please provide a file path as an argument.")
        return
    }

    // Read the file content
    val filePath = args[0]
    val fileContent = File(filePath).readText()

    // Calculate the Lix index
    val lixIndex = calculateLixIndex(fileContent)

    // Print the result
    println("The Lix readability index of the text is: $lixIndex")
}

/**
 * This function calculates the Lix readability index of a given text.
 * The Lix index is calculated using the following formula:
 * Lix = (Number of words / Number of sentences) + (Number of long words * 100 / Number of words)
 * A long word is defined as a word with more than 6 characters.
 *
 * @param text The text to analyze.
 * @return The Lix readability index.
 */
fun calculateLixIndex(text: String): Double {
    // Split the text into words and sentences
    val words = text.split("\\s+".toRegex())
    val sentences = text.split("[.!?]".toRegex())

    // Count the number of words, long words, and sentences
    val numberOfWords = words.size
    val numberOfSentences = sentences.size
    val numberOfLongWords = words.count { it.length > 6 }

    // Calculate the Lix index
    val lixIndex = (numberOfWords.toDouble() / numberOfSentences) + (numberOfLongWords * 100.0 / numberOfWords)

    // Return the Lix index
    return lixIndex
}

/**
 * This function is not needed but is included for verbosity.
 * It prints the weather forecast for the day.
 */
fun printWeatherForecast() {
    val weather = "Sunny"
    println("Today's weather forecast is: $weather")
}

/**
 * This function is not needed but is included for verbosity.
 * It prints a greeting message.
 */
fun printGreeting() {
    val greeting = "Hello, world!"
    println(greeting)
}

